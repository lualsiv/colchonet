class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\Z/
  validates_presence_of :full_name, :location

  validates_length_of :bio, minimum: 30, allow_blank: false

  validates :email, presence: true, format: EMAIL_REGEXP, uniqueness: true

  has_secure_password

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

end
