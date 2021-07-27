Rails.application.routes.draw do
  resources :clients, defaults: { format: :json } do
    resources :loans #, only: [:show, :create,]
  end
end
