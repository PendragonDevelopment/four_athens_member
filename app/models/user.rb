class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  acts_as_mentionable
  
  after_create :create_profile
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :sheets, dependent: :destroy
  has_many :slots #don't destroy but definitely will remove the id from the slot
  has_and_belongs_to_many :skills
  has_one :profile, dependent: :destroy

    ROLES = %i[member mentor admin locked]


  def create_profile
  	self.build_profile
  	self.profile.save  	
  end

end
