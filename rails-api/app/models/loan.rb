class Loan < ActiveRecord::Base
	attribute :value, :integer
  attribute :taxa, :float
  attribute :months, :integer
	default_scope { order(created_at: :desc) }
	validates :value, :taxa, :months, presence: true

	def initialize(attributes = {})
		super
		@value  = attributes[:value]
		@taxa = attributes[:taxa]
		@months = attributes[:months]
	end

	def pmt
		self.class.include Financial
		begin
			taxa = Formulas.to_decimal(@taxa)
			return Formulas::pmt(@value,taxa,@months)
		rescue => e
			raise e
		end
	end
end