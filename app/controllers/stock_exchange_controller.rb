class StockExchangeController < ApplicationController

    def index 
    @se = StockExchange.all
    end

    def show 
    @se = StockExchange.find_by(id:params[:stock_exchange_id])
    end

    

end
