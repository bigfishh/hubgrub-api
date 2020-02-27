class Restitem < ApplicationRecord
  #associations
  belongs_to :item
  belongs_to :restaurant

  has_many :orderitems, dependent: :destroy
  has_many :orders, through: :orderitems
end
