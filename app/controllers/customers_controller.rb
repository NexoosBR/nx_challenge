class CustomersController < ApplicationController
  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: customer, serializer: Customer::Create::CustomerSerializer, status: :created
    else
      render json: { errors: customer.errors }, status: :unprocessable_entity
    end
  end

  def customer_params
    params.require(:customer).permit(:name)
  end
end
