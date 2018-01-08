Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]

  # Regular user's routes
  root "restaurants#index"

  # Admin's routes
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
