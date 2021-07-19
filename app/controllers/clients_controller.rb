class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    begin
      @client.destroy
    rescue ActiveRecord::InvalidForeignKey => e
      render json: "Client cannot be removed as it is associated with a loan", status: :failed_dependency
    rescue
      render json: "Unable to delete client", status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      begin
        @client = Client.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: "Client not found", status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:full_name, :email)
    end
end
