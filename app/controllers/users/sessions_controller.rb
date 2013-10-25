class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    redirect_to (new_client)
  end

end