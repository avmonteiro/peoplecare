Rails.application.routes.draw do
  root 'home#index'
  resources :patients, only: [:new, :create]
end
