# frozen_string_literal: true

class ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    render json: Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :not_found
  end

  def create
    render json: Client.create!(create_client_params)
  rescue ActiveRecord::RecordInvalid => e
    render json: e.message, status: :bad_request
  end

  private

  def create_client_params
    params.require(:client).permit(client_params)
  end

  def client_params
    %i[name client_type email telephone cpf_cnpj]
  end
end
