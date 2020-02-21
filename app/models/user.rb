class User < ApplicationRecord
    #associations
    has_many :orders, dependent: :destroy
    has_many :restaurants, through: :orders

    #bcrypt
    has_secure_password

    # validations
    validates :username, presence: true, uniqueness: true
end
