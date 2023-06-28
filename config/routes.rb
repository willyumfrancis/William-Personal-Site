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


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

constraints(host: 'will-site-dc0779429fbc.herokuapp.com') do
  match '_any_path', to: redirect(subdomain: 'www', domain: 'willfrancisco.com'), via: :all, _any_path: '(/.*)'
end

