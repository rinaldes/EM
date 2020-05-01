class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender_id, :conversation_id, :created_at, :username, :avatar, :receiver_id, :receiver_username, :receiver_avatar

  def body
    object.message.body
  end

  def sender_id
    object.message.sender_id
  end

  def conversation_id
    object.message.conversation_id
  end

  def username
    object.message.sender.name
  end

  def avatar
    HOST + object.message.sender.avatar.url
  end

  def receiver_id
    object.receiver_id
  end

  def receiver_username
    object.receiver.name
  end

  def receiver_avatar
    HOST + object.receiver.avatar.url
  end

end