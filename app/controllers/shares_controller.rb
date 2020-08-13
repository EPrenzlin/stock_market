class SharesController < ApplicationController

    def index 
    @shares = Share.all
    end

    def new 
    @share = Share.new
    end

    def create 
    #need to do the private params
    binding.pry
    @share = Share.new(share_params)
    end
    
    def show 
    @share = Share.find_by(id:params[:id])
    end

    private 

    def share_params
    require(:share).permit(:company_id, :stockexchange_id, :price, :type, :dividend)
    end
    #for stock_exchange (id:params[:share][:stock_exchange_id])
    #use hidden_field for the new stock, and have a company_id there. 
    #you can't just make new shares without it being associated with a company. 
end
