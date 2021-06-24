Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :credits, only: %i[create]
      resources :requesters, only: %i[create]
      resources :loans, except: %i[index]
    end
  end
end
