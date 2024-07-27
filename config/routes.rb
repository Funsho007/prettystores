Rails.application.routes.draw do
  # Define Devise routes for admin users only once
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Define ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Define other resources
  resources :pages, param: :title, only: :show

  # Define root path
  root to: 'products#index'

  # Define health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Define products routes
  resources :products, only: [:index, :show] do
    collection do
      get 'on_sale'
      get 'new_arrivals'
      get 'recently_updated'
    end
  end

  # Define categories routes with nested products index route
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end
end
