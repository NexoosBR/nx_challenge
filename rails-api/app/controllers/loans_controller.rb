class LoansController < ApplicationController
	before_action :validate_params_create, only: [:create]
	before_action :validate_params_show, only: [:show]

  def create
    begin
      value = params[:value].to_i
      taxa = params[:taxa].to_f
      months = params[:months].to_i
      loan = create_a_loan({
				value:value,
				taxa:taxa,
				months:months})
      render json: { loan: loan.attributes.merge(pmt: loan.pmt) }
		rescue ActiveModel::ValidationError => e
      render json:{'errors': e}, status: 400
    rescue => e
      Rails.logger.info e
      render body:nil, status: 500
    end
  end

	def show
		begin
			id = params[:id].to_i
			loan = Loan.find(id)
			render json: { loan: loan.attributes.merge(pmt: loan.pmt)}
		rescue ActiveRecord::RecordNotFound => e
			render body: nil, :status => 204
		rescue => e
			Rails.logger.info e
			render body: nil, status: 500
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

	def validate_params_show
		render body: nil, :status => 422 unless (params[:id].present?) && (!params[:id].to_i.zero?) && (Integer(params[:id]) rescue false)
	end

  def validate_params_create
			render body: nil, :status => 422 unless params[:value].present?
			render body: nil, :status => 422 unless params[:taxa].present?
			render body: nil, :status => 422 unless params[:months].present?
		end
	end