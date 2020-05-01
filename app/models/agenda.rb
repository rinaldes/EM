class Agenda < ActiveRecord::Base
  belongs_to :event
  belongs_to :agenda_type
  has_many :programmes, :dependent => :destroy
  accepts_nested_attributes_for :programmes, :allow_destroy => true, :reject_if => lambda { |c| c[:title].blank? }

  # validates :title, :presence => true

  before_save :set_time

  def set_time
    self.start_time = self.start_time.to_time if self.start_time.present?
    self.end_time = self.end_time.to_time if self.end_time.present?
  end

  def self.in_date(in_date)
    if in_date.present?
      where("agenda_date = ?", in_date)
    else
      where(nil)
    end
  end
end
