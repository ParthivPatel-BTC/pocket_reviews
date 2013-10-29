module ApplicationHelper

  def is_user?
    @user = current_user
    return nil unless @user
    @user_role = UserRole.find_by_user_id(@user.id)
  end

  def is_current_user?
    @user = current_user
  end
end
