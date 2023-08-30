Rails.application.routes.draw do
  devise_for :users

  get 'home/about'
  root 'home#index'
  get "home/friends"
  resources :friends
  get 'portfolio', to: 'portfolio#index', as: 'portfolio'
  get 'social', to: 'social#index', as: 'social'
  get 'contact', to: 'contact#index', as: 'contact'
  get 'search/google', to: 'search#google'

  # config/routes.rb
post 'transcribe_audio', to: 'transcriptions#create'



end

