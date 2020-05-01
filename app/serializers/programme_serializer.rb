class ProgrammeSerializer < ActiveModel::Serializer
  attributes :id, :agenda_id, :title, :start_time, :end_time, :programme_date, :description, :status

  has_many :session_feedbacks, :serializer => SessionFeedbackSerializer

  def start_time
  	format_time(object.start_time)
  end

  def end_time
  	format_time(object.end_time)
  end

  def format_time(time)
  	time.strftime("%H:%M")
  end

end
