class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :user
 
  validates_presence_of :post_content

  default_scope -> { order('created_at DESC') }
end
