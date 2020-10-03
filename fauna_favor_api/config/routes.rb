Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/animals', to: 'animals#random'
  get '/animals/search/:search_param', to: 'animals#search'
end
