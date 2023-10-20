Rails.application.routes.draw do
  devise_for :users

  resources :feeds
  resources :subscriptions, only: [:new, :create, :index]
  resources :articles
  resources :boards

  get '/read_articles', to: 'read_articles#read_index'
  get '/read_later_articles', to: 'read_articles#read_later_index'
  post '/mark_as_read/:article_id', to: 'user_article_interactions#mark_as_read'
  post '/mark_as_read_later/:article_id', to: 'user_article_interactions#mark_as_read_later'
  post '/add_to_board/:article_id/:board_id', to: 'articles#add_to_board'

  # Defines the root path route ("/")
  # root "articles#index"
end
