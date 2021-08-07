class Loan < ApplicationRecord
	attribute :value, :integer
  attribute :taxa, :float
  attribute :months, :integer
	default_scope { order(created_at: :desc) }
	validates :value, numericality: { only_integer: true, greater_than: 0, less_than: 999999999 }, length: { in: 2..12 }, presence: true
	validates :taxa, numericality: { only_float: true, greater_than: 0.00 }, length: { in: 1..5 }, presence: true, format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
	validates :months, numericality: { only_integer: true, greater_than: 0, less_than: 421 }, presence: true

	def initialize(attributes = {})
		super
		@value  = attributes[:value]
		@taxa = attributes[:taxa]
		@months = attributes[:months]
	end

	def pmt
		begin
			return Financial::pmt(
				self.value,
				Financial::percent_to_decimal(self.taxa),
				self.months)
		rescue => e
			raise e
		end
	end

end