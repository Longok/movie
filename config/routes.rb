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

  resources :showtimes do
    resources :bookings 
  end
  resources :films

  resources :bookings do
    resources :payments
  end

end
