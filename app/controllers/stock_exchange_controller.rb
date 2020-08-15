class StockExchangeController < ApplicationController
before_action :authenticate

    def index 
    @se = StockExchange.all
    end

    def show 
    @se = StockExchange.find_by(id:params[:id])
    end

    private
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
