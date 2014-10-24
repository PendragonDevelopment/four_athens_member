class SkillsController < ApplicationController
before_action :authenticate_user!

  def index
  	@skills = Skill.order('id')
  end

  def show
  	@skill = Skill.find(params[:id])
  	@users = @skill.users.order("users.last_name ASC")
    @skills = Skill.order('id')

  end

  def create
  	@newskill = Skill.create(skill_params)
  	if @newskill.save(skill_params)
  		redirect_to :back
	else
	  flash[:notice] = "The skill could not be created."
      redirect_to :back
    end
  end

  def destroy
  	if
      skill = Skill.find(params[:id]).destroy
      	redirect_to :back
     	authorize! :destroy, skill
    else
      flash[:notice] = "The skill could not be deleted."
      redirect_to :back
    end
  end

  def sort
    params[:skill].each_with_index do |id, index|
      skill = Skill.find(id)
      skill.update_attribute(:position, index) if skill
    end
    render nothing: true
  end



private

    def skill_params
      params.require(:skill).permit(:skill_name)
    end


end


