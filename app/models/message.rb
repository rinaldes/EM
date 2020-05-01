class Message < ActiveRecord::Base
  belongs_to :programme

  validates :user_ids, :presence => true
  validates :message, :presence => true

  def self.search(search)
    if search.present?
      where("message ILIKE ?", "%#{search}%")
    else
      where(nil)
    end
  end

  def self.broadcast_message(message)
    array_user_id = message.user_ids
    users = User.where("id IN (?)", array_user_id.split(",").map {|i| i.to_i})
    gcm = GCM.new(GCM_API_KEY)
    registration_ids = users.pluck(:registration_id)
    error_push = nil
    options = {data: {message: "#{message.message}"}}
    response = gcm.send_notification(registration_ids, options)
    response_body = JSON.parse(response[:body])
    if response_body["failure"] != 0
      response_body["results"].each do |value|
        error_push = value["error"]
      end
    end

    return error_push, response
  end
end
