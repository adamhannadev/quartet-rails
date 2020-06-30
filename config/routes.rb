Rails.application.routes.draw do
  get 'main/index'
  get 'main/dashboard'
  get 'main/choose-song'
  get 'main/record'
  get 'main/mix'
  devise_for :users
  root to: "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
