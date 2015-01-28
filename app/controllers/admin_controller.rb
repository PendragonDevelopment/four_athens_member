class AdminController < ApplicationController

  def index
  	@users = User.order('last_name')
  	authorize! :read, User
    @skills = Skill.order('position')
    @skill = Skill.new

  end

  def update
  	@user = User.find(params[:user][:id])

    if @user.update_attributes(user_params)
      @users = User.order('last_name')
      authorize! :read, User
      redirect_to admin_index_path
    else
      flash[:alert] = "User was not updated successfully."
      @users = User.order('last_name')
      authorize! :read, User
      redirect_to admin_index_path
    end
  end


  def destroy
    if
      user = User.find(params[:id]).destroy
      redirect_to :back
     	authorize! :destroy, User
    else
      flash[:notice] = "The user could not be deleted."
      redirect_to :back
    end
  end



	private
	    def user_params
	      params.require(:user).permit(:id, :role)
	    end


end



