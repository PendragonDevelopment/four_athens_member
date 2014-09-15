class SkillsController < ApplicationController

  def index
  	@skills = Skill.order('id')
  end

  def show
  	@skill = Skill.find(params[:id])
  	@users = @skill.users.order("users.last_name ASC")
    @skills = Skill.order('id')

  end
end
