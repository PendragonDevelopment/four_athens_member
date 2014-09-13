class ProfilesController < ApplicationController
  def index
  	@users = User.order('last_name') 
  	@skills = Skill.order('id')
  end

  def edit
  end
end
