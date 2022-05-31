Rails.application.routes.draw do
  root 'home#index'

  get '/sign-up', to: "users#new", as: 'sign-up'

  resources :users
end
