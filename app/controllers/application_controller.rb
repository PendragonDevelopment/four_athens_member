class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to edit_user_registration_path, :alert => "You do not have the authorization to access that page. Please ensure that your subscription is up-to-date and that you have been given access to that page."
  end


  protected

  def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name) }  
  end
end

