class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :user
 
  validates_presence_of :post_content
  validates_presence_of :user_id


  default_scope -> { order('created_at DESC') }
end
