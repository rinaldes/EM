class AgendaSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :agenda_type, :title, :place, :start_time, :end_time, :agenda_date, :description

  has_many :programmes, :serializer => ProgrammeSerializer#, :dont_embed_friends => true


  def agenda_type
  	object.agenda_type.name
  end

  def start_time
  	format_time(object.start_time)
  end


  def end_time
  	format_time(object.end_time)
  end

  def format_time(time)
  	time.strftime("%H:%M")
  end

private
  def sessions
  	# object.programmeserializer.associations
  end

end
