Rails.application.routes.draw do
  # devise_for :users
  root "users#index"

  resources :users
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "user_profiles#index"
  resources :user_profiles

  resources :warehouses do
    resources :attendances
  end
end
