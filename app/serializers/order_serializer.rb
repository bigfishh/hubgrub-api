class OrderSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :restaurant_name, :food_ordered, :total, :checked_out, :created_at

  def food_ordered
    self.object.orderitems.map do |orderitem| 
      RestitemSerializer.new(orderitem.restitem).as_json.merge({orderitem_id: orderitem.id, quantity: orderitem.quantity})
    end
  end

  def restaurant_name
    if self.object.restaurant_id
      @restaurant = Restaurant.find(self.object.restaurant_id)
      return @restaurant.name
    end
    return nil
  end

  def created_at
    self.object.created_at.strftime("%m-%d-%Y")
  end

  # def restaurant_image
  #   if self.object.restaurant_id
  #     @restaurant = Restaurant.find(self.object.restaurant_id)
  #     return @restaurant.media_image
  #   end
  #   return 
  # end

end
