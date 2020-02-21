class Orderitem < ApplicationRecord
  #associations
  belongs_to :item
  belongs_to :order
end
