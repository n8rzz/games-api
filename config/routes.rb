Rails.application.routes.draw do
  resources :games

  post '/games/:id/vote', to: 'games#vote'
  post '/games/:id/purchase', to: 'games#purchase'
  post '/games/clear', to: 'games#clear'
end
