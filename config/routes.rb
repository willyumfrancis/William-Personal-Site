Rails.application.routes.draw do
  get 'search/google', to: 'search#google'

  devise_for :users

  get 'home/about'
  root 'home#index'
  get "home/friends"
  resources :friends
  get 'projects', to: 'portfolio#index', as: 'projects'
  get 'services', to: 'social#index', as: 'services'
  get 'about', to: 'contact#index', as: 'about'
  get 'contact', to: 'static_pages#namie', as: 'contact'

  get 'builds/:build_id', to: 'builds#show', as: 'build'





  # config/routes.rb
post 'transcribe_audio', to: 'transcriptions#create'



end

