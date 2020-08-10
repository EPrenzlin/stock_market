class CompaniesController < ApplicationController

    def new 
    @c = Company.new
    end

    def create 
    @c = Company.new(company_params)
    @c.save 
    if @c
        session[:id] = @c.id
        redirect_to company_path(@c)
    else 
        redirect_to new 
    end
    end

    private 
    def company_params 
    params.require(:company).permit(:name, :password, :address, :description, :industry)
    end

end
