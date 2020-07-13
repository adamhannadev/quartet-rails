Rails.application.routes.draw do
  resources :backing_tracks
  resources :recordings
  get "recordings/new/:title/:part" => "recordings#new"
  devise_for :users
  get 'dashboard' => 'main#dashboard'
  root "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
