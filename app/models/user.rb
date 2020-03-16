class User < ActiveRecord::Base
	has_many :diet, dependent: :destroy
end