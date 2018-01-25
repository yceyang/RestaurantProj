Rails.application.routes.draw do
  # Regular user's routes
  root "restaurants#index"

  # user
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  
  # restaurant / comment
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end

    member do
      get :dashboard
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
