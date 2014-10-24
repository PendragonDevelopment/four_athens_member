class Slot < ActiveRecord::Base
	


	belongs_to :user
	belongs_to :sheet

	validates_presence_of :start_time
	validates_presence_of :end_time
	validates_presence_of :sheet_id

end
