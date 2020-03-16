class Point < ActiveRecord::Base
	belongs_to :diet
	accepts_nested_attributes_for :diet
end