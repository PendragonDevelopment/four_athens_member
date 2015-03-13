class InvitationsController < Devise::InvitationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:invite) {|u| u.permit(:first_name, :last_name, :email)}
    devise_parameter_sanitizer.for(:accept_invitation) {|p| p.permit(:first_name, :last_name, :email, :invitation_token)}
  end

   private

   def resource_params
     params.permit(user: [:name, :email, :invitation_token, :first_name, :last_name])[:user]
   end

end