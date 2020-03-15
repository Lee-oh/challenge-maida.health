class User < ActiveRecord::Base
	has_many :diet, dependent: :delete_all
	accepts_nested_attributes_for :diet
end