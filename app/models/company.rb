class Company < ApplicationRecord
    has_secure_password 
    has_many :shares 
    has_many :stock_exchanges, through: :shares
    accepts_nested_attributes_for :shares
    
    validates :name, length:{minimum:2} 
    validates :description, length:{minimum:20} 
    validates :password, length:{in:3..10}, confirmation:true
    validates :password_confirmation, presence: true
    validates :address, presence:true
    validates :industry, presence:true
    

    def shares_attributes=(shares_attributes) 
    shares_attributes.values.each do |share| 
        new_share = Share.new 
        new_share.price = share[:price]
        new_share.dividend = share[:dividend]
        new_share.preference = share[:preference]
        new_share.stock_exchange_id = share[:stock_exchange_id]
        self.shares << new_share
    end
    end

    def self.create_from_omniauth(auth)
        Company.find_or_create_by(uid: auth["uid"]) do |c| 
        c.name = auth["info"]["name"]
        c.password = SecureRandom.hex(16)
        c.save(validate:false)
        end
    end


    # def self.order_address
    # Company.order(:name)
    # end

    def self.search(params)
    where("LOWER(address) LIKE ?", "%#{params[:company_search]}%")
    end

end

