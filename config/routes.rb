Rails.application.routes.draw do
  resources :customers, except: :index
  resources :loans, only: [:show, :create] do
  end
end
