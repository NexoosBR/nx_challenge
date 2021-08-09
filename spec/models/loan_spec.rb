require 'rails_helper'

RSpec.describe Loan, type: :model do
    before(:each) do
        @model = Loan.new(total_value: 1000, monthly_fee: 0.3, number_of_months: 48)
    end

    it 'Loan model' do
        loan_params = {
            id: 1,
            total_value: 1000,
            monthly_fee: 0.3,
            number_of_months: 48
        }
        @loan = Loan.create!(loan_params)
        expect(Loan.all.size.positive?).to be true
    end

    it 'validates all attributes' do
        expect(@model).to be_valid
    end

    it 'validates monthly_fee greater than 1.0' do
        @model.monthly_fee = 20

        expect(@model).not_to be_valid
    end

    it 'validates number_of_monts not an integer' do
        @model.number_of_months = 48.5

        expect(@model).not_to be_valid
    end
end