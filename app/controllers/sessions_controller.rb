class SessionsController < ApplicationController

    def welcome 

    end

    def new 
    end

    def create 
    @c = Company.find_by(name:params[:name]) 
    if @c && @c.authenticate(params[:password])
        session[:company_id] = @c.id 
        redirect_to company_path(@c) 
    else 
        redirect_to '/'
    end
    end

    def omniauth   
    c = Company.create_from_omniauth(auth)
    if c.valid?
    session[:company_id] = c.id
    redirect_to company_path(c)
    else
    flash[:message] = c.errors.full_messages.join(", ")
    redirect_to company_path
    end
    end

    def destroy 
    reset_session
    redirect_to '/'
    end

    private 
    def auth 
    request.env["omniauth.auth"]
    end

end
