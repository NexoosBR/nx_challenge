class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients, root: true, include: [loans: { except: [:created_at, :client_id, :updated_at] }]
  end

  # GET /clients/1
  def show
    render json: @client, include: [loans: { except: [:created_at, :client_id, :updated_at]}]
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, include: [:loans], status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client, include: [loans: { except: [:created_at, :client_id, :updated_at]}]
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :nickname, loans_attributes: [:id, :fixed_loan_payment, :loan_amount, :interest_rate, :period, :period_type])
    end
end
