class ApplicationController < ActionController::Base
  #protect_from_forgery
  #helper_method :current_user
   #before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    users_index_path
  end

  def after_update_path_for(resource)
    logger.debug "****************"
    users_index_path
  end

  def configure_permitted_parameters
    logger.debug "****************  configure_permitted_parameters"
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name) }
  end
end
