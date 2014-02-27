class User < ActiveRecord::Base
  has_secure_password


  validates :email, uniqueness: true
  validates :password, length: { in: 4..8 }
end
