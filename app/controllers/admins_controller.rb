class AdminsController < ApplicationController
  def index
  end

  def manage_passwords
    @clients_passwords = User.all
  end

  def reset_password
    @edit_password = User.find(params[:id])
    #logger.debug "*******************#{@edit_password.inspect}"
  end

  def update
    @client_password = User.find(params[:id])
    chk_both_password = check_both_password?(params[:user][:password], params[:user][:password_confirmation])
    if chk_both_password.first
      current_user.update_attribute(:password, params[:user][:password])
      flash[:notice] = 'Password updated successfully.'
      redirect_to :root
    else
      flash[:notice] = chk_both_password.last
      redirect_to :changepassword_users
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