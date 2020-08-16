class SearchController < ApplicationController

    def new 
    if params[:search].blank? 
        redirect_to company_path(session[:company_id])
    else 
    end 
    #we get a params here! 
    end

    def show 

    end

end
