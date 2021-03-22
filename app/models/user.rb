class User < ApplicationRecord
    #associations
    has_many :orders, dependent: :destroy
    has_many :restaurants, through: :orders

    #bcrypt
    has_secure_password

    # validations
    validates :username, presence: true, uniqueness: true
    after_create :set_cart


    def cart 
        self.orders.find_by(checked_out: false)
    end

    def past_orders 
        self.orders.where(checked_out: true)
    end
    

    private

    def set_cart
        self.orders.create()
    end

    
end
