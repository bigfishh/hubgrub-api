class Category < ApplicationRecord
    #associations
    has_many :restaurants, dependent: :destroy
end
