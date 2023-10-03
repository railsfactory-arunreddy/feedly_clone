Rails.application.routes.draw do
  devise_for :users

  resources :feeds
  resources :subscriptions, only: [:new, :create, :index]
  resources :articles

  # Defines the root path route ("/")
  # root "articles#index"
end
