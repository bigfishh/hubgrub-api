class RestitemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :item_name, :price, :restaurant_id

  def item_id
    # byebug
      self.object.item.id
  end

  def item_name
    self.object.item.name
  end

end
