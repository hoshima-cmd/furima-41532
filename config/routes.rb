Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create]
  root to: 'articles#index'
  resources :articles
end
