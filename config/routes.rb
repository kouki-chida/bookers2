Rails.application.routes.draw do

  devise_for :users
  get "home/about" => "homes#about"

  root to: 'homes#top'
   resources :books, only: [:new, :create, :index, :show, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
   resource :relationships, only: [:create, :destroy]
  get "followings" => "relationships#followings", as: "followings"
  get "followers" => "relationships#followers", as: "followers"
end

end

