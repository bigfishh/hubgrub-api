class Restitem < ApplicationRecord
  #associations
  belongs_to :item
  belongs_to :restaurant
end
