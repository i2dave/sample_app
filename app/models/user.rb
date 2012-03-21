# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
	#Tell rails which attributes can be modified automatically by outside users. Only the given attributes—are automatically accessible to outside users.
	attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true, format: { with: valid_email_regex }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}
end
