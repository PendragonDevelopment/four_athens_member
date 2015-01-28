class RegistrationsController < Devise::RegistrationsController

  def create
    if User.check_stripe_for_email(params[:email])
      super
    else
      redirect_to new_user_registration_path, notice: "You are not yet a FourAthens member."
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end