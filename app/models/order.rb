class Order < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :restaurant, optional: true

  has_many :orderitems, dependent: :destroy
  has_many :restitems, through: :orderitems
end
