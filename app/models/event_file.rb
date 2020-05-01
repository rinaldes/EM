class EventFile < ActiveRecord::Base
  mount_uploader :file, CoverUploader

  validates :file, :presence => true
  validates :title, :presence => true

  belongs_to :user
  belongs_to :event
  belongs_to :programme

  def self.search(search)
    if search.present?
      where("users.name ILIKE ? OR event_files.title ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end
end
