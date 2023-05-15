Rails.application.routes.draw do
  root to: 'movies#index'
  mount ActionCable.server => '/cable'

  get '/share' => 'movies#new'
  post '/sign_in', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :movies, only: %i[create]
end
