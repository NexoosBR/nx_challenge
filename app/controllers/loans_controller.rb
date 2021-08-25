class LoansController < ApplicationController
  def create
    loan = Loan.new(loan_params)
    return render json: loan.errors, status: :unprocessable_entity unless loan.save

    render json: { loan: { id: loan.id } }, status: :created
  end

  def show
    loan = Loan.find_by(id: params[:id])
    return render json: { message: I18n.t('messages.not_found') }, status: :not_found if loan.nil?

    render json: { loan: { id: loan.id, pmt: loan.pmt } }
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :rate, :pmt)
  end
end
