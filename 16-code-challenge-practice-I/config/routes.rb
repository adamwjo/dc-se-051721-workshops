Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/campers', to: 'campers#index'
  get '/campers/:id', to: 'campers#show'
  post '/campers', to: 'campers#create'

  delete '/activities/:id', to: 'activities#destroy'

  post '/signups', to: 'signups#create'
end
