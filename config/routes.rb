Rails.application.routes.draw do
  devise_for :patients
  devise_for :professionals

  root 'home#index'

  resources :patients, only: [:show]
  resources :professionals, only: [:show]
end
