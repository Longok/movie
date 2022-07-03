Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get '/titket', to: "home#show_titket"

  get '/sign-up', to: "users#new"
  post '/sign-up', to: "users#create"

  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users
  resources :rooms do
    resources :seats
  end

  resources :showtimes do
    resources :bookings 
  end
  resources :films

  resources :bookings do
    resources :payments
  end

end
