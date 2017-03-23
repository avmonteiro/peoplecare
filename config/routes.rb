Rails.application.routes.draw do
  devise_for :professionals
  root 'home#index'
  resources :patients, only: [:new, :create, :show]
  resources :professionals, only: [:new, :create, :show]
end
