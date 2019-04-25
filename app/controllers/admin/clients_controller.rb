class Admin::ClientsController < AdminController

  def admin_profile

  end

  def edit

  end

  def new
    @client = Client.new
  end

  def create
    render plain: params[:client].inspect
  end

end
