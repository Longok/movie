Rails.application.routes.draw do

  root 'home#index'

  get '/sign-up', to: "users#new"
  post '/sign-up', to: "users#create"

  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users
end
