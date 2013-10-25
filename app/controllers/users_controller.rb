class UsersController < ApplicationController
  def index
    @users = User.order("first_name").page(params[:page]).per(2)
  end

  def destroy
      User.find(params[:id]).destroy
      flash[:notice] = "Record deleted successfully"
      redirect_to :users_index
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Record updates successfully"
      redirect_to :users
    else
      render :edit
    end
  end

  def reset_password
    @user = User.find(params[:id])
    render template: "devise/passwords/edit"
  end

  def update_password
      @user = User.find(params[:id])
      chk_both_password = check_both_password?(params[:user][:password], params[:user][:password_confirmation])
      if chk_both_password.first
        current_user.update_attribute(:password, params[:user][:password])
        flash[:notice] = 'Password changed successfully.'
        redirect_to :manage_passwords_admins_path
      else
        flash[:notice] = chk_both_password.last
        redirect_to :reset_password
      end
  end

  def show
    @user = User.find(params[:id])
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