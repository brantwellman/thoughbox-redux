Rails.application.routes.draw do
  root 'links#index'

  resources :users, only: [:new]

  get '/portal', to: 'sessions#portal'
  get '/login', to: 'sessions#new'
end
