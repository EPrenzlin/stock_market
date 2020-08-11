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
    raise params.inspect
    end
 

end
