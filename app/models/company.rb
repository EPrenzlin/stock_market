class Company < ApplicationRecord
    has_secure_password 
    has_many :shares 
    has_many :stock_exchanges, through: :shares
    
end
