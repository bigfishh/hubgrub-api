class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :media_image, :latitude, :longitude
  has_many :restitems
end
