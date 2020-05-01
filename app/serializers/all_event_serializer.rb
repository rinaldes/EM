class AllEventSerializer < ActiveModel::Serializer

  attributes :id, :name, :start_date, :end_date, :event_size, :event_cover, :venue_name, :address, :latitude, :longitude, :description, :status,

   def event_size
    object.event_size.name
  end

  def event_cover
    HOST + object.cover.url
  end


end