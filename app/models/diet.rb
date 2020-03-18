class Diet < ActiveRecord::Base
	belongs_to :user
	has_many :point, dependent: :destroy
	accepts_nested_attributes_for :user

	validates :title, length: { minimum: 10 }

	validates :description, length: { minimum: 10 }

	validates :height,:weight,:target_weight, numericality: true

	validates :title,:description,:schedule,:start,
	:finish,:period,:height,:weight,:target_weight, presence: true
	
	validates :finish, presence: true, format:{with: /\A\d{4}-(0[1-9]|1[012])-(([012][0-9])|(3[01]))\Z/, on: :create}
	validates :finish, presence: true, format:{with: /\A\d{4}-(0[1-9]|1[012])-(([012][0-9])|(3[01]))\Z/, on: :create}

end