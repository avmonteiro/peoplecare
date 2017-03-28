Rails.application.routes.draw do
  devise_for :patients
  devise_for :professionals

  root 'home#index'

  resources :patients, only: [:show] do
    collection do
      get 'nearby'
      get 'search'
    end
  end

  resources :professionals, only: [:show] do
    collection do
      get 'nearby'
      get 'search'
    end
  end

  resources :emails, only:[:new, :create, :update, :show]

end
