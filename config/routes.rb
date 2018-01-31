Rails.application.routes.draw do
  # Regular user's routes
  root "restaurants#index"

  # user
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do

    ## followship (sol1)
    #member do
      ## users / id / follow
      #post :follow
      ## users / id / unfollow
      #post :unfollow
    #end

  end

  # followship (sol2)
  resources :followships, only: [:create, :destroy]
  
  # restaurant
  resources :restaurants, only: [:index, :show] do

    # restaurant / comment
    resources :comments, only: [:create, :destroy]

    collection do
      # restaurant / feeds
      get :feeds
    end
    
    member do
      # restaurants / id / dashboard
      get :dashboard

      # restaurants / id / favorite
      post :favorite
      # restaurants /id / unfavorite
      post :unfavorite

      # restaurant / id / like
      post :like
      # restaurant / id / unlike
      post :unlike
    end
  end

  # category
  resources :categories, only: [:show]

  # admin's routes
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
