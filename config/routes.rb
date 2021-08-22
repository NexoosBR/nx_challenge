# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clients, only: %i[index create show] do
    resources :loans, only: %i[index create show]
  end
end
