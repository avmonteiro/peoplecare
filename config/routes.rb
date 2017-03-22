Rails.application.routes.draw do
  root 'home#index'
  resources :patients, only: [:new, :create]
  resources :professionals, only: [:new, :create, :show]
end
