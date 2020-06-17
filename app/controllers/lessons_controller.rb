class LessonsController < ApplicationController
    
    def new
        @lesson = Lesson.new
    end

    def show
        @lesson = Lesson.find(params[:id])
    end

    def create
      @lesson = Lesson.new(lesson_params)
      @lesson.company_id = current_user.company_id
        if @lesson.save
            flash[:success] = "Lesson added!"
            redirect_to company_path(current_user.company_id)   
          else
            render 'new'
          end
    end

    def delete
    end

    def update
    end

    private

  def lesson_params
    params.require(:lesson).permit(:name,
       :note, :date, :price)
  end
end
