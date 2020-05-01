class SessionFeedback < ActiveRecord::Base
  has_many :session_feedback_options
  has_many :session_feedback_answers
  belongs_to :programee

  has_many :session_feedback_options, :dependent => :destroy
  accepts_nested_attributes_for :session_feedback_options, :allow_destroy => true, :reject_if => lambda { |c| c[:option].blank? }

  validates :event_id, :presence => true
  validates :question, :presence => true
  validates :answer_type, :presence => true

  after_update :update_options

  def update_options
    self.session_feedback_options.delete_all if (self.answer_type == 'Rating' || self.answer_type == 'Objective')
  end
end
