require 'rails_helper'

RSpec.describe Loan, :type => :model do
  fixtures :loan
  describe "Modelo Loan" do

    it "Loan é válido" do
      loan = Loan.new({
        value:  loan(:xpto).value,
        taxa:   loan(:xpto).taxa,
        months: loan(:xpto).months
      })
      expect(loan).to be_valid
    end

    it "Loan não é vádilo sem o campo value" do
      loan = Loan.new({
        taxa:   loan(:xpto).taxa,
        months: loan(:xpto).months
      })
      expect(loan).not_to be_valid
    end

    it "Loan não é vádilo sem o campo taxa" do
      loan = Loan.new({
        value:  loan(:xpto).value,
        months: loan(:xpto).months
      })
      expect(loan).not_to be_valid
    end

    it "Loan não é vádilo sem o campo months" do
      loan = Loan.new({
        value:  loan(:xpto).value,
        taxa:   loan(:xpto).taxa
      })
      expect(loan).not_to be_valid
    end

    it "Loan não é válido com a taxa zero" do
      loan = Loan.new({
        value:  loan(:xpto).value,
        taxa:   0,
        months: loan(:xpto).months
      })
      expect(loan).not_to be_valid
    end

    it "Loan não é válido sem um prazo definido" do
      loan = Loan.new({
        value:  loan(:xpto).value,
        taxa:   loan(:xpto).taxa,
        months: 0
      })
      expect(loan).not_to be_valid
    end

    it "Loan não é válido sem valor" do
      loan = Loan.new({
        value:  0,
        taxa:   loan(:xpto).taxa,
        months: loan(:xpto).months
      })
      expect(loan).not_to be_valid
    end

  end
end