class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @clients = @company.clients.paginate(page: params[:page])
    @lessons = @company.lessons.paginate(page: params[:page])
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      flash[:success] = "Company created!"
      current_user.company_id = @company.id
      current_user.add_role :admin, @company
      current_user.save
      redirect_to current_user   
    else
      render 'new'
    end
  end


  def edit
    @company = Company.find(params[:id])
  end

  def update 
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "Profile updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,
       :addres, :nip)
  end

end
