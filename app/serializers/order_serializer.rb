class OrderSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :food_ordered, :total, :checked_out

  def food_ordered
    self.object.orderitems.map do |orderitem| 
      RestitemSerializer.new(orderitem.restitem).as_json.merge({orderitem_id: orderitem.id})
    end
  end

end
