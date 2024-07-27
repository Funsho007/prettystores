Rails.application.routes.draw do
  # Define Devise routes for admin users only once
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Define ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Define other resources
  resources :pages, param: :title, only: :show

  # Define root path
  root to: 'pages#show', defaults: { title: 'home' }

  # Define health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #
  root 'products#index'
  resources :products, only: [:index, :show]
end
