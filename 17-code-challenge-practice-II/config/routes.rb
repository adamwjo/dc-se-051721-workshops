Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'
  get '/song/topchart', to: 'songs#top_charts'

  delete '/super_fans/:id', to: 'super_fans#destroy'

  post '/reviews', to: 'reviews#create'
end
