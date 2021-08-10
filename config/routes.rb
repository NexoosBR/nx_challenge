Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :loans, only: [:show, :create]
  resources :authenticate, controller: 'authenticate', only: [:create]
end
