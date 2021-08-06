Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/loans/:id', to: 'loans#show', constraint: { id: /\d+/ }, as: 'show'
  post '/loans', to: 'loans#create', as: 'create'
end
