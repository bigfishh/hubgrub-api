class RestitemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :item_name, :price, :restaurant_id, :ordered_quantity

  def item_id
    # byebug
      self.object.item.id
  end

  def item_name
    self.object.item.name
  end

  # def ordered_quantity
  #   self.object.orderitems.find do |orderitem|
  #     orderitem.quantity
  #   end
  # end 

end
