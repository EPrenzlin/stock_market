class StockExchange < ApplicationRecord
    has_many :shares 
    has_many :companys, through: :shares
end
