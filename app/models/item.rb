class Item < ApplicationRecord
    #associations
    has_many :restitems, dependent: :destroy
    has_many :restaurants, through: :restitems
end
