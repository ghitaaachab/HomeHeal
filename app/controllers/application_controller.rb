class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, :set_no_navbar, if: :devise_controller?
  # # before_action :set_time_zone, if: :user_signed_in?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  # end
  before_action :authenticate_user!

end
