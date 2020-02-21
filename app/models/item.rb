class Item < ApplicationRecord
    #associations
    has_many :orderitems, dependent: :destroy
    has_many :orders, through: :orderitems

    has_many :restitems, dependent: :destroy
    has_many :restaurants, through: :restitems
end
