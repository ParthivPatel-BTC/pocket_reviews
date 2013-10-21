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
end