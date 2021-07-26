class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :update, :destroy]

  # GET /loans
  def index
    @loans = Loan.all

    render json: @loans
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  def destroy
    begin
      @loan.destroy
    rescue
      render json: "Unable to delete loan", status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      begin
        @loan = Loan.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: "Loan not found", status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:financed_amount, :rate, :months, :client_id)
    end
end
