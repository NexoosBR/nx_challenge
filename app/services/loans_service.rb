class LoanService
  def initialize(my_params)
    @loan = Loan.new(my_params)
  end

  def call
    createLoan
  end

  private

  def createLoan
    if loan.save
      puts "loan created"
    else
      render json: { errors: loan.errors }, status: :unprocessable_entity
    end
  end
end