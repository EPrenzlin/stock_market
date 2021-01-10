class Share < ApplicationRecord
    belongs_to :company 
    belongs_to :stock_exchange

    validates :price, numericality:{ only_integer: true }
    validates :preference, presence:true 
    validates :dividend, presence:true
    validates :company, presence:true
    validates :stock_exchange, presence:true


    def self.search_price(params) 
    where("price LIKE ?", "#{params[:share_search].to_i/10}_")
    end

    def self.share_price_order
    self.all.order(:price)
    end

end
