Rails.application.routes.draw do
  resources :backing_tracks
  get "recordings/new/:title/:part" => "recordings#new", as: 'new_rec'
  get 'mixes/new/(:title)/(:part)', to: 'mixes#new'
  resources :recordings
  resources :mixes
  devise_for :users
  get 'dashboard' => 'main#dashboard'
  root "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
