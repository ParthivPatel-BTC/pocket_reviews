class ApplicationController < ActionController::Base
  #protect_from_forgery
  #helper_method :current_user
   #before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    #logger.debug"******************"
    admins_path
  end

  def after_sign_up_path_for(resource)
    users_index_path
  end


end
