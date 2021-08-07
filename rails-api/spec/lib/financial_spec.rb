require "rails_helper" 

RSpec.describe Financial do
  fixtures :loan
  describe "Modulo Financeiro" do

    it "Converte 4.77% para decimal(0.0477)" do
      percent = 4.77
      decimal = Financial::percent_to_decimal(percent)
      expect(decimal).to(eq(0.0477))
    end

    it "Confere quantidade de casas decimais menor ou igual a 4" do
      expect(Financial::max_four_decimal_places(0)).to(eq(true))
      expect(Financial::max_four_decimal_places(4)).to(eq(true))
      expect(Financial::max_four_decimal_places(4.7)).to(eq(true))
      expect(Financial::max_four_decimal_places(4.77)).to(eq(true))
      expect(Financial::max_four_decimal_places(0.047)).to(eq(true))
      expect(Financial::max_four_decimal_places(0.0477)).to(eq(true))
      expect(Financial::max_four_decimal_places(0.0477777)).to(eq(false))
    end

    it "Confere se é um número" do
      expect(Financial::is_number? "50").to(eq(true))
      expect(Financial::is_number? 29).to(eq(true))
      expect(Financial::is_number? 1.65).to(eq(true))
      expect(Financial::is_number? 18.897456).to(eq(true))

      expect(Financial::is_number? "Nexoos").to(eq(false))
      expect(Financial::is_number? [1, "Nexoos"]).to(eq(false))
      expect(Financial::is_number? true).to(eq(false))
    end

    it "A Loan xpto deve possuir pmt igual a 7085.81" do
      xpto_pmt = Financial::pmt(
        loan(:xpto).value, 
        Financial::percent_to_decimal(
          loan(:xpto).taxa), 
        loan(:xpto).months)
      expect(xpto_pmt).to(eq(7085.81))
    end

  end
end