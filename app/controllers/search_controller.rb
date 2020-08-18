class SearchController < ApplicationController
    # before_action :authenticate

    def new 
    if params[:share_search].blank? && params[:company_search].blank? 
    flash[:alert] = "You did not search for anything"
    redirect_to companies_path
    elsif !params[:share_search].blank? && params[:company_search].blank?
    @shares = Share.search_price(params)
    elsif !params[:company_search].blank? && params[:share_search].blank?
    @address = Company.search(params)
    end 
    end


end
