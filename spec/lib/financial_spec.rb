require "rails_helper" 

RSpec.describe Financial do
  fixtures :loan
  describe "Modulo Financeiro" do

    context "Calculando do pmt" do

      it "A Loan xpto deve possuir pmt igual a 7085.81" do
        xpto_pmt = Financial::pmt(
          loan(:xpto).value, 
          Financial::percent_to_decimal(
            loan(:xpto).taxa), 
          loan(:xpto).months)
        expect(xpto_pmt).to(eq(7085.81))
      end

    end

    context "Passando argumento inválido para o calculo do pmt" do

      it "Deve lançar erro/exceção do tipo ArgumentError" do

        expect {
          Financial::pmt(
            "argumento inválido", 
            Financial::percent_to_decimal(
              loan(:xpto).taxa), 
            loan(:xpto).months)
        }.to raise_error(ArgumentError)

        expect {
          Financial::pmt(
            loan(:xpto).value, 
            Financial::percent_to_decimal(
              "argumento inválido"), 
            loan(:xpto).months)
        }.to raise_error(ArgumentError)

        expect {
          Financial::pmt(
            loan(:xpto).value,
            Financial::percent_to_decimal(
              loan(:xpto).taxa), 
            "argumento inválido")
        }.to raise_error(ArgumentError)

      end
    end

    context "Convertendo percentagem para decimal" do

      it "4.77% para 0.0477" do
        decimal = Financial::percent_to_decimal(4.77)
        expect(decimal).to(eq(0.0477))
      end

    end

    context "Passando argumento inválido para o conversor %_to_decimal" do

      it "Deve lançar erro/exceção do tipo ArgumentError" do
        expect {
          Financial::percent_to_decimal("argumento inválido")
        }.to raise_error(ArgumentError)
      end

    end

  end
end