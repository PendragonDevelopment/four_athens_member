class ProfilesController < ApplicationController
before_action :authenticate_user!


  def index
    authorize! :read, Profile
  	@users = User.order('last_name') 
  	@skills = Skill.order("position")
  end

  def show

    authorize! :read, Profile
    @user = User.find(params[:id])
    @skills = Skill.order('id')
    @posts = Post.where({ user_id: params[:id]}).order("posts.created_at DESC")
    @comments = Comment.order("comments.created_at ASC")  
  end


  def edit
    @profile = current_user.profile
    authorize! :manage, @profile
    @skills = Skill.order('position')
  end

  def update
      @profile = current_user.profile  
      authorize! :manage, @profile
  	  @profile.update(profile_params)
      skill_array = params[:user][:skill_ids].to_a
      skill_array.each_with_index do |s, i|
        skill_array[i] = s.to_i unless skill_array[i].blank?
      end
        if current_user.update_attributes(skill_ids: params[:user][:skill_ids])
          redirect_to directory_path
        else
          redirect_to edit_profile_path
        end
  end


  private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def profile_params
	  params.require(:profile).permit(:avatar, :position, :company, :phone, :micro_bio, :linked_in, :twitter, :dribble, :behance, :codepen, :github, :user
    )

	end
end
