class ClientsController < ApplicationController

  def index
    @clients = Client.order("business_name").page(params[:page]).per(5)
    if !@clients.present?
      redirect_to admins_path
    end
  end

  def dashboard
    client_user_record = User.find(current_user.id)
    @client = Client.find_by_email_address(client_user_record.email)
  end

  def review_invitation
  end

  def new
    @client  = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      client_user_email = @client.email_address
      client_user_default_password = Settings.default_password
      User.create(:email => client_user_email, :password => client_user_default_password, :username => client_user_email)

      user_id_for_role = User.find_by_email(@client.email_address)
      UserRole.create(:user_id => user_id_for_role.id, :role_id => '2')
      flash[:notice] = "Record inserted successfully"
      redirect_to :admins
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
    @urls = @client.client_urls
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:notice] = "Record updates successfully"
      redirect_to :clients
    else
      render :edit
    end
  end

  def change_current_client_password
    @user = User.find_by_id(current_user.id)
  end

  def reset_password
    @user = User.find(params[:id])
    render template: "devise/passwords/edit"
  end

def update_current_client_password
  @user = User.find(params[:id])
      chk_both_password = check_both_password?(params[:user][:password], params[:user][:password_confirmation])
      if chk_both_password.first
        @user.update_attribute(:password, params[:user][:password])
        flash[:notice] = 'Password changed successfully.'
        redirect_to :manage_passwords_admins
      else
        flash[:notice] = chk_both_password.last
        render :change_current_client_password
      end
end


  def update_password
      @user = User.find(params[:id])
      chk_both_password = check_both_password?(params[:user][:password], params[:user][:password_confirmation])
      if chk_both_password.first
        @user.update_attribute(:password, params[:user][:password])
        flash[:notice] = 'Password changed successfully.'
        redirect_to :manage_passwords_admins
      else
        flash[:notice] = chk_both_password.last
        render template: "devise/passwords/edit"
      end
  end

  def show
    @client = Client.find(params[:id])
    @client_urls = @client.client_urls
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      flash[:notice] = "Record deleted successfully"
      redirect_to :clients
    end
  end

  def active
    update_client_status_and_redirect(:activated)
  end

  def deactive
    update_client_status_and_redirect(:deactivated)
  end

  def load_reviews
    client_data = Client.find(params[:client_id])
    @client_business_name = client_data.business_name
    #@client_reviews_by_id = Review.joins(:ClientUrls).joins('WHERE reviews.client_id =', params[:client_id])
    connection = ActiveRecord::Base.connection
    result = ActiveRecord::Base.connection.execute("select r.*, cu.* from reviews r left join client_urls cu on r.client_id = cu.client_id where r.client_id = #{params[:client_id]}")
    @client_reviews_by_id = Array.new
    result.each do |row|
      obj = ReviewClientUrl.new
      obj.directory_url = row['directory_url']
      obj.posted_on = row['posted_on']
      obj.submitted_on = row['submitted_on']
      @client_reviews_by_id << obj
    end
    # @client_reviews_by_id = Review.find :all,
    #                         :select => 'reviews.*, client_urls.*',
    #                         :joins => 'LEFT JOIN client_urls ON reviews.client_id = client_urls.client_id',
    #                         :conditions => 'reviews.client_id' => params[:client_id]
     respond_to { |format|
        format.js {
          render file: 'clients/load_reviews'
        }
      }
  end

  def feedback
  end

end

private

def update_client_status_and_redirect(client_status)
  @client = Client.find(params[:id])

  if client_status == :deactivated
    new_status = false

  elsif client_status == :activated
    new_status = true
  end

  if @client.update_attribute(:active, new_status)
    flash[:notice] = "#{client_status} successfully"
    redirect_to :clients
  end
end

