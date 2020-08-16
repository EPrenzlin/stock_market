class CompaniesController < ApplicationController
before_action :authenticate, only:[:index, :edit, :show]

    def new 
    @c = Company.new
    end

    def create 
    @c = Company.new(company_params)
    @share = Share.new
    @share.price = params[:company][:share][:price]
    @share.dividend = params[:company][:share][:dividend]
    @share.preference = params[:company][:share][:preference]
    @share.stock_exchange_id = params[:company][:share][:stock_exchange_id]
    @c.shares << @share
    @c.save
    binding.pry
    if @c.valid?
        session[:company_id] = @c.id
        redirect_to company_path(@c)
    else 
        render new_company_path 
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
    @current_user = current_user
    end


    private 
    def company_params 
    params.require(:company).permit(:name, :password,:password_confirmation,:address, :description, :industry)
    end

    def current_user
    Company.find_by(id:session[:company_id])
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
