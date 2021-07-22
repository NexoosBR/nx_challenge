# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoansController do
  describe 'GET show' do
    it do
      get :show, params: { id: 1 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end
  end
 
  describe 'POST create' do
    it do
      post :create, params: { loan: { value: "1", rate: 2, installment: 4 } }
      param = JSON.parse(response.body).with_indifferent_access
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
  
end
