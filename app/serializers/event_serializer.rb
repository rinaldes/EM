class EventSerializer < ActiveModel::Serializer
  # attributes :id, :name, :start_date, :end_date, :event_size, :event_cover, :venue_name, :address, :latitude, :longitude, :description, :status,
  attributes :user_id, :event_id, :role, :invitation_token, :name, :start_date, :end_date, :event_size, :event_cover, :venue_name, :address, :latitude, :longitude, :description, :status

  def role
  	object.category.name
  end

  def name
  	object.event.name
  end

  def start_date
  	object.event.start_date
  end

  def end_date
  	object.event.end_date
  end

   def event_size
    object.event.event_size.name
  end

  def event_cover
    HOST + object.event.cover.url
  end

  def venue_name
  	object.event.venue_name
  end

  def address
  	object.event.address
  end

  def latitude
  	object.event.latitude
  end

  def longitude
  	object.event.longitude
  end

  def description
  	object.event.description
  end

  def status
  	object.event.status
  end

end
