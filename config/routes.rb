Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :comments, only: [:create]
  root to: 'users#index'
end
