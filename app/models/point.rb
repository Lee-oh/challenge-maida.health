class Point < ActiveRecord::Base
	belongs_to :diet
	accepts_nested_attributes_for :diet
	validates :title, length: { minimum: 10 }
	validates :title,:weight, presence: true
	validates :weight, numericality: true
	validates :schedule, presence: true, format:{with: /\A\d{4}-(0[1-9]|1[012])-(([012][0-9])|(3[01]))\Z/, on: :create}
end