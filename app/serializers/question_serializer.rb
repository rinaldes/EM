class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :status, :vote_number, :programme_id, :event_id, :voted

  def status
    if object.status.present?
      object.status
    else
      ''
    end
  end

  def vote_number
    object.vote_number.to_i
  end

  def voted
    User.current.voted_for? object
  end

end