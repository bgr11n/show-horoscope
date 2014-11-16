Rails.application.routes.draw do

  devise_for :users
  
  root to: "users#index"

  get '/users/:id/show_horoscope/', to: 'users#show_horoscope', as: 'show_horoscope'

end
