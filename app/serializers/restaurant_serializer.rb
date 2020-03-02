class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :media_image, :latitude, :longitude, :category
  has_many :restitems
  # belongs_to :category

  def category
    self.object.category.name
  end

end
