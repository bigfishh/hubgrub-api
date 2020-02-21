class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude
  has_many :restitems
end
