Rails.application.routes.draw do
  root 'links#index'

  get '/portal', to: 'sessions#portal'
end
