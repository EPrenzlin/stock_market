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

    def index 
    if logged_in 
        @c = Company.all 
    else 
        render :new
    end
    end

    def edit 
        if logged_in 
            @c = Company.find_by(id:params[:id]) 
        else 
            render :new
        end
    end

    def update 
    @c = Company.find_by(id:params[:id])
    @c.update(company_params) 
    redirect_to company_path(@c)
    end

    def show 
    #need to add in an authorisation ; you can't see unless you are logged in. 
    #make one so if no session id, not allowed. 
    if logged_in 
    @c = Company.find_by(id:params[:id]) 
    else 
        render :new
    end
    end
        

    private 
    def company_params 
    params.require(:company).permit(:name, :password, :address, :description, :industry)
    end

end
