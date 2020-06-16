class LessonsController < ApplicationController
    
    def new
        @lesson = Lesson.new
    end

    def show
        @lesson = Lesson.find(params[:id])
        @lesson.company_id = current_user.company_id.id
        if @lesson.save
            flash[:success] = "Lesson added!"
            redirect_to company_path(current_user)   
          else
            render 'new'
          end
    end

    def create
    end

    def delete
    end

    def update
    end

    private

  def company_params
    params.require(:company).permit(:name,
       :addres, :nip)
  end
end
