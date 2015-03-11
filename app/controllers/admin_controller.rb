class AdminController < ApplicationController

  def index
    authorize! :read, User
  	@users = User.order('last_name')
    @skills = Skill.order('position')
    @skill = Skill.new

  end

  def update
    authorize! :update, User
  	@user = User.find(params[:user][:id])
    if @user.update_attributes(user_params)
		  @users = User.order('last_name')
      redirect_to admin_index_path
    else
      flash[:alert] = "User was not updated successfully."
      @users = User.order('last_name')
      redirect_to admin_index_path
    end
  end

  # def destroy
  #   authorize! :destroy, User
  #   if
  #     user = User.find(params[:id]).destroy
  #     redirect_to :back
  #   else
  #     flash[:notice] = "The user could not be deleted."
  #     redirect_to :back
  #   end
  # end



	private

  def user_params
    params.require(:user).permit(:id, :role)
  end

end



