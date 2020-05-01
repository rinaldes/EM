class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar, :department, :phone, :email

  def avatar
    HOST + object.avatar.url
  end

end
