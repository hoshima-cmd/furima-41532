Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :orders , only: [:index,:create]
  root to: 'items#index'

end
