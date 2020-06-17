class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    @company.company_id = current_company.id
    if @company.save
      flash[:success] = "Company created!"
      current_company.company_id = @company.id
      current_company.save
      redirect_to current_company   
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
