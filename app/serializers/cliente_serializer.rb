class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :nome, :email, :cpf, :telefone
end
