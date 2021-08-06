class Loan < ActiveRecord::Base
	attribute :value, :integer
  attribute :taxa, :float
  attribute :months, :integer
	default_scope { order(created_at: :desc) }
	validates :value, :taxa, :months, presence: true

	def pmt
		self.class.include Financial
		begin
			pmt(self.value, self.taxa, self.months)
		rescue => e
			raise e
		end
	end
end