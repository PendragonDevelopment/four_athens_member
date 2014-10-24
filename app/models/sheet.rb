class Sheet < ActiveRecord::Base

	belongs_to :user
	has_many :slots, dependent: :destroy
end
