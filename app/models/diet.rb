class Diet < ActiveRecord::Base
	belongs_to :user
	has_many :point, dependent: :destroy
	accepts_nested_attributes_for :user	
end