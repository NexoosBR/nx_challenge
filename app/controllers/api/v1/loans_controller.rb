# frozen_string_literal: true

class Api::V1::LoansController < ApplicationController
  def make_loan
    render json: {loan: {id: 1}}
  end

  def payments
    pmt =  3_700 / 12
    render json: {loan: {id: 1, pmt: pmt}}
  end
end