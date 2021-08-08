class Loan < ApplicationRecord
	before_save :pmt
	attribute :value, :integer
  attribute :taxa, :float
  attribute :months, :integer
	attribute :pmt, :float

	validates :value, numericality: { only_integer: true, greater_than: 19, less_than: 1000000001 }, length: { in: 2..10 }, presence: true
	validates :taxa, numericality: { only_float: true, greater_than: 0.00 }, presence: true, format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
	validates :months, numericality: { only_integer: true, greater_than: 0, less_than: 421 }, presence: true

	def initialize(attributes = {})
		super
		@value  = attributes[:value]
		@taxa 	= attributes[:taxa]
		@months = attributes[:months]
	end

	def pmt
		begin
			tx = Financial::percent_to_decimal(self.taxa)
			self.pmt = Financial::pmt(self.value, tx, self.months)
		rescue => e
			raise e
		end
	end

end