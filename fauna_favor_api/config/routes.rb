Rails.application.routes.draw do
  resources :favorites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/animals', to: 'animals#random'
  get '/animals/search/:search_param', to: 'animals#search'
  post '/animals/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
end
