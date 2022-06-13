Rails.application.routes.draw do

  root 'home#index'

  get '/sign-up', to: "users#new"
  post '/sign-up', to: "users#create"

  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users
  resources :rooms do
    resources :seats 
  end

  resources :seats do 
    resources :bookings
  end

  resources :showtimes
  resources :films

end
