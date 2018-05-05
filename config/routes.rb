Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: :show

  # Top
  get 'user_policy' => 'top#user_policy'
  get 'privacy_policy' => 'top#privacy_policy'

  # Book
  get 'books/search' => 'books#search'
  get 'books/search_by_keyword' => 'books#search_by_keyword'
  resources :books, only: [:index, :show, :create, :destroy]

  # UserBook
  resources :user_books, only: [:index, :create, :destroy]

  # UserBookComment
  resources :user_book_comments, except: [:show]

  # Publisher
  resources :publishers, only: [:show]

  # API
  namespace :v1, format: 'json' do
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end

  # View Routing Errors
  # match '*path' => 'application#render_404', via: :all
end
