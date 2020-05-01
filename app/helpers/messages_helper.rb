module MessagesHelper
  def get_users(user_ids)
    user_ids = user_ids.split(", ")
    users = User.where("id IN (?)", user_ids).pluck(:name).join(", ")

    return users
  end
end
