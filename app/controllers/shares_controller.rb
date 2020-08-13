class SharesController < ApplicationController

    def index 
    @shares = Share.all
    end

    def new 
    @share = Share.new
    @company = current_user
    end

    def create 
    share = Share.new(share_params)
    binding.pry
    end
    
    def show 
    @share = Share.find_by(id:params[:id])
    end

    private 
    def share_params
    params.require(:share).permit(:company_id, :stock_exchange_id, :price, :preference, :dividend)
    end
    #for stock_exchange (id:params[:share][:stock_exchange_id])
    #use hidden_field for the new stock, and have a company_id there. 
    #you can't just make new shares without it being associated with a company. 

    def current_user
    Company.find_by(id:session[:id])
    end

end

