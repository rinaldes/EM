class Programme < ActiveRecord::Base
  belongs_to :agenda
  has_many :session_feedbacks
  has_many :event_files
  has_many :messages
  has_many :questions
  # validates :title, :presence => true

  before_save :set_time
  after_update :create_attendee

  def set_time
    self.start_time = self.start_time.to_time if self.start_time.present?
    self.end_time = self.end_time.to_time if self.end_time.present?
  end

  def create_attendee
    attended = Attendee.where(event_id: self.agenda.event_id, :name => self.speaker).first
    attende = Attendee.create(:name => self.speaker, event_id: self.agenda.event_id, category_id: 2 ) if !attended
  end

end
