class CompaniesController < ApplicationController
before_action :authenticate, only:[:index, :edit]

    def new 
    @c = Company.new
    end

    def create 
    @c = Company.new(company_params)
    share = Share.new
    share.price = params[:company][:share][:price]
    share.dividend = params[:company][:share][:dividend]
    share.preference = params[:company][:share][:preference]
    share.stock_exchange_id = params[:company][:share][:stock_exchange_id]
    @c.shares << share
    @c.save
    if @c.valid?
        session[:company_id] = @c.id
        binding.pry
        redirect_to company_path(@c)
    else 
        redirect_to new 
    end
    end

    def index 
    if logged_in?
        @c = Company.all 
    else 
        render :new
    end
    end

    def edit 
        current_user 
        if logged_in?
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
    @c = Company.find_by(id:params[:id]) 
    end


    private 
    def company_params 
    params.require(:company).permit(:name, :password, :address, :description, :industry)
    end

    def current_user
    Company.find_by(id:session[:id])
    end
        
    def logged_in? 
    !!current_user 
    end
            
    def authenticate
    if logged_in? == true
    true
    else
    redirect_to '/'
    end
    end

end
