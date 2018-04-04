class User < ApplicationRecord
  has_secure_password
  has_one :account
  validates_presence_of :name, :email, :password_digest
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
end
