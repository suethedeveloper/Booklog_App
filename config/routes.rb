Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations'}
  get 'dashboard/index'

  resources :users do
    resources :readings
  end

  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  resources :friendships, only: [:show, :create, :destroy]

  root 'dashboard#index'

end