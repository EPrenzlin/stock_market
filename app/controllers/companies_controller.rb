class CompaniesController < ApplicationController

    def new 
    @c = Company.new
    end

    def create 
    @c = Company.new(company_params)
    @c.save 
    if @c
        session[:company_id] = @c.id
        redirect_to company_path(@c)
    else 
        redirect_to new 
    end
    end

    def show 
    
    end

    private 
    def company_params 
    params.require(:company).permit(:name, :password, :address, :description, :industry)
    end

end
