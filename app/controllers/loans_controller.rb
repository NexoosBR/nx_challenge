class LoansController < ApplicationController
	before_action :validate_params_loan, only: [:create]
	before_action :validate_param_id, only: [:show]

  def create
    begin
      value = params[:value].to_i
      taxa = params[:taxa].to_f
      months = params[:months].to_i
      loan = create_a_loan({
				value:value,
				taxa:taxa,
				months:months})
      render json: { loan: { id: loan.id } }
		rescue ActiveModel::ValidationError => e
      render json:{'errors': e}, status: 400
    rescue => e
      houston(e)
    end
  end

	def show
		begin
			id = params[:id].to_i
			loan = Loan.find(id)
			url = request.path_info
			if url.include?('amortization')
				render json: { loan: { id:loan.id, pmt:loan.pmt }, amortization: Financial::amortization(loan) }
			else
				render json: { loan: { id:loan.id, pmt:loan.pmt } }
			end
		rescue ActiveRecord::RecordNotFound => e
			render body: nil, :status => 204
		rescue => e
			houston(e)
		end
	end

	protected

  def create_a_loan(attributes = {})
    begin
      loan = Loan.new(attributes)
			raise ActiveModel::ValidationError.new(loan) if loan.invalid?
      loan.save
      return loan
		rescue => e
      Rails.logger.info e
			raise e
    end
	end

	def validate_param_id
		render body: nil, :status => 422 unless (params[:id].present?) && (!params[:id].to_i.zero?) && (Integer(params[:id]) rescue false)
	end

  def validate_params_loan
			render body: nil, :status => 422 unless params[:value].present?
			render body: nil, :status => 422 unless params[:taxa].present?
			render body: nil, :status => 422 unless params[:months].present?
		end
	end