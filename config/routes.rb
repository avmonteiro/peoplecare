Rails.application.routes.draw do
  root 'home#index'

  resources :professionals, only: [:new, :create, :show]
end
