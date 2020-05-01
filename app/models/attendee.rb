class Attendee < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :category
  has_many :questions
  mount_uploader :avatar, AvatarUploader

  validates :event_id, :presence => true
  validates :category_id, :presence => true

  before_create :generate_qrcode
  before_create :set_status

  def self.search(search)
    if search.present?
      where("name LIKE ? OR email LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end

  def generate_qrcode
    self.invitation_token = SecureRandom.urlsafe_base64(20)
  end

  def set_status
    self.status = 'pending'
  end

end