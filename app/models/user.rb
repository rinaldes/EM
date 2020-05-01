class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  validates :name, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true

  has_many :attendees #, :dependent => :destroy
  has_many :events, :through => :attendees
  has_many :event_files
  has_many :messages, :dependent => :destroy
  has_many :questions, :dependent => :destroy

  acts_as_messageable
  acts_as_voter

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.hex
      return unless self.class.exists?(authentication_token: authentication_token)
    end
    save!
    authentication_token
  end

  def avatar_url
    HOST + self.avatar.url
  end

  def is_admin_event?(user, event)
    admin = Attendee.where(event_id: event.id, user_id: user.id, category_id: 3)
    return true if admin.present?
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

end