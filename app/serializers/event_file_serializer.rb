class EventFileSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :file

  def file
    HOST + object.file.url
  end

end
