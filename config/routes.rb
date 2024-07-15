Rails.application.routes.draw do
  root "users#index"

  resources :users
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "up" => "rails/health#show", as: :rails_health_check
end
