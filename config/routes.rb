Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :restaurants

  # Regular sser's routes
  root "restaurants#index"

  # Admin's routes
  namespace :admin do
    resources :restaurants
    root "restaurants#index"
  end
end
