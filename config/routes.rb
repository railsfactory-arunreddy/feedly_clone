Rails.application.routes.draw do
  devise_for :users

  resources :feeds
  resources :subscriptions, only: [:new, :create, :index]
  resources :articles

  post '/mark_as_read/:article_id', to: 'user_article_interactions#mark_as_read'

  # Defines the root path route ("/")
  # root "articles#index"
end
