class StaticPagesController < ApplicationController
  def registration
  end

  def welcome
   redirect_to :admins if is_current_user? && !is_user?
  end
end
