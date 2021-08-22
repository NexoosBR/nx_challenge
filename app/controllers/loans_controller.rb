# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_client

  def index
    render json: @client.loans
  end

  def show
    render json: @client.loans.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :not_found
  end           

  def create
    render json: Loan.create!(create_loan_params)
  rescue ActiveRecord::RecordInvalid => e
    render json: e.message, status: :bad_request
  end

  private

  def create_loan_params
    param = params.require(:loan)
    param[:client_id] = params[:client_id]
    param.permit([*loan_params, :client_id])
  end

  def loan_params
    %i[value months rate]
  end

  def set_client
    @client = Client.find(params[:client_id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :not_found
  end
end
