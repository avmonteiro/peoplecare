Rails.application.routes.draw do
  devise_for :professionals
  root 'home#index'
  resources :patients, only: [:new, :create, :show] do
    collection do
      get 'nearby'
    end
  end

  resources :professionals, only: [:show]
end
