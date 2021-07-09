class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def show
    render json: @customer
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: customer, status: :created
    else
      render json: { errors: customer.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: { errors: @customer.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    render status: :no_content
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :document,
      :full_name
    )
  end
end
