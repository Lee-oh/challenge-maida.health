class User < ActiveRecord::Base
	has_many :diet, dependent: :destroy
	validates :password, length: { minimum: 6 }
	validates :username,:email,:password, presence: true
	before_save { self.email = email.downcase }
	validates :email, presence: true,
	format:{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create},
	uniqueness: {case_sensitive: false}
end