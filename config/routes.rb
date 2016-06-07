Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new, :create]
  resources :links, only: [:create]

  get '/portal', to: 'sessions#portal'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
end
