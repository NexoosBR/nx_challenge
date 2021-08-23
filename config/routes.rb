Rails.application.routes.draw do
  resources :loans, only: [:show, :create] do
    get 'loans/:id' ,to: 'loans#show'
    post 'loans' ,to: 'loans#create'
  end
end
