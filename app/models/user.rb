class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  acts_as_mentionable
  
  after_create :create_profile
  has_many :comments
  has_many :posts
  has_and_belongs_to_many :skills
  has_one :profile

  def create_profile
  	self.build_profile
  	self.profile.save  	
  end

end
