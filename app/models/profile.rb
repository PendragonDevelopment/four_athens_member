class Profile < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, default_url: 'face.jpg'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  validates :micro_bio, length: { maximum: 140 }

end
