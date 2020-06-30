Rails.application.routes.draw do
  get 'dashboard' => 'main#dashboard'
  get 'choose-song'=> 'main#choose-song'
  get 'record' => 'main#record'
  get 'mix' => 'main#mix'
  devise_for :users
  root "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
