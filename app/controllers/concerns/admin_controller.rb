class AdminController < ApplicationController

  def admin_profile

  end

  def client_base

  end

  def edit_client

  end

  def new_client
    @client = Client.new
  end

  def create
    render plain: params[:client].inspect
  end

end
