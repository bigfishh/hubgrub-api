class Orderitem < ApplicationRecord
  #associations
  belongs_to :restitem
  belongs_to :order
end
