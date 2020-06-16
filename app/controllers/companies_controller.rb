class CompaniesController < ApplicationController
  def new
    @user = current_user
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      flash[:success] = "Company created!"
      redirect_to @user   
    else
      render 'new'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,
       :addres, :nip)
  end

end
