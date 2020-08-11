Rails.application.routes.draw do
  resources :backing_tracks
  resources :mixes
  get '/mix' => "recordings#mix"
  get "recordings/new/:title/:part" => "recordings#new", as: 'new_rec'
  resources :recordings
  devise_for :users
  get 'dashboard' => 'main#dashboard'
  root "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
