Rails.application.routes.draw do

  devise_for :users
  get "home/about" => "homes#about"

  root to: 'homes#top'
   resources :books, only: [:new, :create, :index, :show, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  resources :users


end

