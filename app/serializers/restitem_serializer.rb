class RestitemSerializer < ActiveModel::Serializer
  attributes :id, :item

  def item
    # byebug
    {
      id: self.object.item.id,
      name: self.object.item.name
    }
  end

end
