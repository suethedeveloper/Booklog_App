Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}
  get 'dashboard/index'

  root 'dashboard#index'

  resources :users do
    resources :readings
  end

end
