class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :post

  acts_as_mentioner


  default_scope -> { order('created_at ASC') }
end
