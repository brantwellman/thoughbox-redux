Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new, :create]

  get '/portal', to: 'sessions#portal'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
