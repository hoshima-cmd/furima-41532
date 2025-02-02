Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  get 'items/index'
  root to: "items#index"
end
