class Share < ApplicationRecord
    belongs_to :company 
    belongs_to :stock_exchange
end
