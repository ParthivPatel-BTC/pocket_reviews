class AdminsController < ApplicationController
  def index
  end

  def manage_passwords
    @clients = Client.all
  end
end