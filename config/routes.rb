Rails.application.routes.draw do
  devise_for :users

  get 'home/about'
  # root 'home#index'
  root 'friends#index'
  get "home/friends"
  resources :friends
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

