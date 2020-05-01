class SessionFeedbackSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :programme_id, :question, :answer_type
  has_many :session_feedback_options, :serializer => SessionFeedbackOptionSerializer

end
