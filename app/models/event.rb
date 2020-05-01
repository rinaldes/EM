class Event < ActiveRecord::Base
  validates :name, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  # validates :event_size_id, :presence => true
  validates :address, :presence => true
  validates :description, :presence => true

  has_one :event_size
  has_many :agendas, :dependent => :destroy
  accepts_nested_attributes_for :agendas, :allow_destroy => true, :reject_if => lambda { |c| c[:title].blank? }

  has_many :attendees, :dependent => :destroy
  accepts_nested_attributes_for :attendees, :allow_destroy => true, :reject_if => lambda { |c| c[:event_id].blank? }

  has_many :productions, :dependent => :destroy
  accepts_nested_attributes_for :productions, :allow_destroy => true, :reject_if => lambda { |c| c[:production_item_id].blank? }

  has_many :realizations, :dependent => :destroy
  accepts_nested_attributes_for :realizations, :allow_destroy => true, :reject_if => lambda { |c| c[:production_item_id].blank? }

  has_many :session_feedbacks, :dependent => :destroy
  has_many :event_files
  has_many :messages
  has_many :questions

  belongs_to :event_size

  before_create :set_status

  mount_uploader :cover, CoverUploader

  def set_status
    self.status = 'created'
  end

  def is_created?
    return true if self.status == 'created'
  end

  def is_submitted?
    return true if self.status == 'submitted'
  end

  def self.search(search)
    if search.present?
      # joins(:office).where("lower(offices.office_name) LIKE ?", "%#{in_branch}%")
    else
      where(nil)
    end
  end

  def self.get_attendees(event_id, search)
    attendees = Attendee.joins(:event, :user, :category).where("event_id" => event_id, status: 'attended')
    if search.present?
      attendees = attendees.where("lower(users.name) LIKE ? OR lower(users.email) LIKE ? OR lower(categories.name) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end

    return attendees
  end
end
