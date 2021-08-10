require 'rails_helper'

RSpec.describe Loan, :type => :model do
  fixtures :loan
  describe "Modelo Loan" do

    context "Validação" do

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

      it "Loan não é vádilo pois a taxa deve ser maior que zero" do
        loan = Loan.new({
          value:  loan(:xpto).value,
          taxa:   0,
          months: loan(:xpto).months
        })
        expect(loan).not_to be_valid
      end

      it "Loan não é vádilo pois o limite de caracteres é igual a 6" do
        loan = Loan.new({
          value:  loan(:xpto).value,
          taxa:   1.9999999,
          months: loan(:xpto).months
        })
        expect(loan).not_to be_valid
      end

      it "Loan não é vádilo pois a parte inteira deve possuir no maximo 3 digitos" do
        loan = Loan.new({
          value:  loan(:xpto).value,
          taxa:   1234.9,
          months: loan(:xpto).months
        })
        expect(loan).not_to be_valid
      end

      it "Loan não é vádilo pois o financiamento mínimo é de 20 reais e na parte inteira o minimo de digitos para o valor do emprestimo é 2" do
        loan = Loan.new({
          value:  1.50,
          taxa:   loan(:xpto).taxa,
          months: loan(:xpto).months
        })
        expect(loan).not_to be_valid
      end

      it "Loan não é vádilo pois o prazo máximo de financiamento é de 420 meses" do
        loan = Loan.new({
          value:  loan(:xpto).value,
          taxa:   loan(:xpto).taxa,
          months: 421
        })
        expect(loan).not_to be_valid
      end

    end
  end
end