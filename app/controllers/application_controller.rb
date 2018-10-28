class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    "/profile/#{current_user.id}"
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit %i(sign_up keys: %i(name profile profile_image))
    devise_parameter_sanitizer.permit %i(account_update keys: %i(name profile profile_image))
  end
end
