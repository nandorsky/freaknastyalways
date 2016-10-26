class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
      # Fields for sign up
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :role) }
      # Fields for editing an existing account
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password, :role) }
  end

end



