class Share < ApplicationRecord
    belongs_to :company 
    belongs_to :stock_exchange

    validates :price, numericality:{ only_integer: true }
    validates :preference, presence:true 
    validates :dividend, presence:true
    validates :company, presence:true
    validates :stock_exchange, presence:true


    def self.search_price(params) 
    where("LOWER(price) LIKE ?", "%#{params[:share_search].to_i}%")
    end
    # where("LOWER(address) LIKE ?", "%#{params[:company_search]}%")

end
