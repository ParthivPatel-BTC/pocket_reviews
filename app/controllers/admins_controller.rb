class AdminsController < ApplicationController
  def index
    @clients = Client.order("business_name").where('active = true').all
  end

  def manage_passwords
    @clients_passwords = User.order("username").where("id != ?", current_user.id).page(params[:page]).per(5)
  end

  def reset_password
    @admin = User.find(current_user)
  end

  def update
    @client_password = User.find(current_user.id)
    chk_both_password = check_both_password?(params[:user][:password], params[:user][:password_confirmation])
    if chk_both_password.first
      @client_password.update_attribute(:password, params[:user][:password])
      flash[:notice] = 'Password updated successfully.'
      redirect_to :manage_passwords_admins
    else
      flash[:notice] = chk_both_password.last
      redirect_to :reset_password_admins
    end
  end

end

private

def check_both_password?(password, confirm_password)
   flag = true
   msg = ''
    if(!password.present?)
      flag = false
      msg = "Password can't be blank"
    elsif(!confirm_password.present?)
      flag = false
      msg = "Confirm password can't be blank"
    elsif(password != confirm_password)
      flag = false
      msg = "Password and confirm password must be same"
    end
    return flag, msg
end