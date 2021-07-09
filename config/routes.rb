Rails.application.routes.draw do
  resources :customers, except: :index do
    resources :loans, only: [:index, :show, :create]
  end
end
