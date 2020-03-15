class Diet < ActiveRecord::Base
	belongs_to :user
	has_many :point, dependent: :delete_all
end