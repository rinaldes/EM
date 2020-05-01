class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :name, :phone, :department, :category, :avatar

  def name
  	object.user.name.try(:titleize)
  end

  def phone
  	object.user.phone
  end

  def department
      object.user.department.present? ? object.user.department.try(:titleize) : ""
  end

  def category
    object.category.name.try(:titleize)
  end

  def avatar
    HOST + object.user.avatar.url
  end

end
