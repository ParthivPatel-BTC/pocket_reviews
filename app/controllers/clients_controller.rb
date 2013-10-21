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
    @clients = Client.order("company_name").page(params[:page]).per(2)
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
end
