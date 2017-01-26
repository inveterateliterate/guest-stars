Rails.application.routes.draw do

  devise_for :users

  # resources :appearances
  get '/search' => 'search#query', as: 'search'

  resources :episodes

  get '/guest_stars/:name' => 'guest_stars#show', as: 'guest_star'
  resources :guest_stars
  root 'series#index'
  get '/series/:series_title' => 'series#show', as: 'series'
  resources :series, except: [:show]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
