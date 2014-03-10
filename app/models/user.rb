class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { in: 4..8 }

  def has_notifications?
    false
  end

  def has_email?
    false
  end
end
