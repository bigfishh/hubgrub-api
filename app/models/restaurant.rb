class Restaurant < ApplicationRecord
  #associations
  belongs_to :category

  has_many :orders, dependent: :destroy
  has_many :users, through: :orders 

  has_many :restitems, dependent: :destroy
  has_many :items, through: :restitems
end
