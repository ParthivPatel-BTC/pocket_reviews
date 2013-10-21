class Users::RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(resource)
    users_index_path
  end
end