class SharesController < ApplicationController
before_action :authenticate
    
    def index 
    @c = Company.find_by(id:session[:company_id])
    @shares = Share.share_price_order
    end

    def new 
    if params[:company_id].to_i == current_user.id
    @share = Share.new
    @company = current_user
    else 
        redirect_to company_path(current_user.id)
    end
    end

    def create 
    share = Share.new(share_params)
    share.save
    if share.valid?
        redirect_to company_shares_path(current_user) 
    else 
        redirect_to company_path(current_user) 
    end
       end
    
    def show 
    @share = Share.find_by(id:params[:id])
    end

    def edit 
    if authorized?
    @company = current_user
    @share = Share.find_by(id:params[:id])
    else 
        redirect_to company_path(current_user.id)
    end 
    end

    def update 
    @share = Share.find_by(id:params[:id])
    @share.update(share_params)
    redirect_to company_shares_path(@share.company_id)
    end

    def destroy 
    share = Share.find_by(id:params[:id])
    if share.company_id == current_user.id 
        share.destroy
        redirect_to company_shares_path(current_user)
    else 
        redirect_to company_shares_path(current_user)
    end
    end

    private 
    def share_params
    params.require(:share).permit(:company_id, :stock_exchange_id, :price, :preference, :dividend)
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
    
    def authorized? 
    if current_user.shares.include?(Share.find_by(id:params[:id])) 
        true 
    else 
        false
    end
    end

end

