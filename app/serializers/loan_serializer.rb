# frozen_string_literal: true

class LoanSerializer < ActiveModel::Serializer
  attributes :id, :value, :rate, :months, :pmt, :created_at, :updated_at
end
