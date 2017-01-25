Rails.application.routes.draw do
  devise_for :users

  #get '/series/:series_title' => 'series#series_by_title', as: "series_by_title"
  get '/series/:series_title/season/:season_num' => 'series#episodes_by_season', as: 'episodes_by_season'
  get '/guest_stars/:name/appearances/:series_title' => 'guest_stars#appearances_by_series', as: 'appearances_by_series'

  resources :appearances
  resources :episodes
  resources :guest_stars
  resources :series
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
