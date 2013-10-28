class ApplicationController < ActionController::Base
  #protect_from_forgery
  #helper_method :current_user
   #before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    @user = current_user
    @user_role = UserRole.find_by_user_id(@user.id)

    if @user_role == nil
      admins_path
    else
      client_dashboard_path
    end
  end

  def after_sign_up_path_for(resource)
    users_index_path
  end
end
