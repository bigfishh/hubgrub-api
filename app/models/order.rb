class Order < ApplicationRecord
  #associations
  belongs_to :user, dependent: :destroy
  belongs_to :restaurant

  has_many :orderitems, dependent: :destroy
  has_many :items, through: :orderitems
end
