class Company < ApplicationRecord
    has_secure_password 
    has_many :shares 
    has_many :stock_exchanges, through: :shares
    
    def self.create_from_omniauth(auth)
        Company.find_or_create_by(uid: auth["uid"]) do |c| 
        c.name = auth["info"]["name"]
        c.password = SecureRandom.hex(16)
        c.save 
        end
    end

end
