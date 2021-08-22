# frozen_string_literal: true

require 'cpf_cnpj'

FactoryBot.define do
  factory :client, class: 'Client' do
    name { Faker::Name.name }
    client_type { Client.client_types.values.sample }
    cpf_cnpj { physical? ? CPF.generate : CNPJ.generate }
    email { Faker::Internet.email }
    telephone { Faker::Internet.email }
  end
end
