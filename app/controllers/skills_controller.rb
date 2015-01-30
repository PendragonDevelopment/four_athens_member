class SkillsController < ApplicationController
before_action :authenticate_user!

  def index
    authorize! :read, Skill
  	@skills = Skill.order('id')
  end

  def show
    authorize! :read, Skill
  	@skill = Skill.find(params[:id])
  	@users = @skill.users.order("users.last_name ASC")
    @skills = Skill.order('id')
  end

  def create
  	@newskill = Skill.new(skill_params)
    authorize! :create, @newskill

  	if @newskill.save(skill_params)
  		redirect_to :back
	  else
	    flash[:notice] = "The skill could not be created."
      redirect_to :back
    end
  end

  def destroy
      skill = Skill.find(params[:id])
      authorize! :destroy, skill
  	if skill.destroy
      	redirect_to :back
    else
      flash[:notice] = "The skill could not be deleted."
      redirect_to :back
    end
  end

  def sort
    authorize! :read, Skill
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


