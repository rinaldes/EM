class AccomodationSerializer < ActiveModel::Serializer
  attributes :id, :production_type, :item, :quantity, :days, :price, :notes, :total

  def production_type
  	object.production_type.name
  end

  def item
  	object.production_item.name
  end

end
