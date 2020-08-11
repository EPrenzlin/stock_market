class SessionsController < ApplicationController

    def welcome 

    end

    def new 
    end

    def create 
    @c = Company.find_by(name:params[:name]) 
    if @c && @c.authenticate(parms[:password])
        sessions[:company_id] = @c.id 
        redirect_to company_path(@c) 
    else 
        redirect_to '/'
    end
    end

    def omniauth   
    c = Company.find_or_create_by(uid: request.env["omniauth.auth"]["uid"])
    c.name = request.env["omniauth.auth"]["info"]["name"]
    c.password = SecureRandom.hex(16)
    c.save 
    if c.valid?
    session[:id] = c.id
    redirect_to new_company_path
    else
    flash[:message] = c.errors.full_messages.join(", ")
    redirect_to company_path
    end
    end

    private 
    def auth 
    if request.env["omniauth.auth"]["info"]["name"] 
    end

    end
 

end
