class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :img_url
  has_many :past_orders
  has_one :cart

end
