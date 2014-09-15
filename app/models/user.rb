class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 
  has_many :comments
  has_many :posts
  has_and_belongs_to_many :skills
  has_one :profile
 
end
