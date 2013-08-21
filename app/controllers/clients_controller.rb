class ClientsController < ApplicationController
  skip_before_action :auth!, only: [:new, :create]
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all.page(params[:page])
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      ClientMailer.welcome(@client).deliver
      redirect_to login_path, notice: 'Welcome to MiniBank! Please login.'
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /clients/1  
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :surname, :email, :phone, :password, :password_confirmation)
    end
end
