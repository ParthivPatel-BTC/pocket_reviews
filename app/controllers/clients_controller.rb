class ClientsController < ApplicationController

  def new
    @client  = Client.new
  end

  def create
    @client = Client.new(params[:client])

    if @client.save
      flash[:notice] = "Record inserted successfully"
      redirect_to :clients
    else
      render :new
    end
  end

  def index
    @clients = Client.order("business_name").page(params[:page]).per(2)
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

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      flash[:notice] = "Record deleted successfully"
      redirect_to :clients
    end
  end

  def active
    update_client_status_and_redirect(:activate)
  end

  def deactive
    update_client_status_and_redirect(:deactive)
  end
end

private

def update_client_status_and_redirect(client_status)
  @client = Client.find(params[:id])

  if client_status == :deactive
    new_status = false

  elsif client_status == :activate
    new_status = true
  end

  if @client.update_attribute(:active, new_status)
    flash[:notice] = "Record updates successfully"
    redirect_to :clients
  end

end