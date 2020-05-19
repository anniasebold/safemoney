Rails.application.routes.draw do
  get 'home/about'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :users, only: [:show]

  resources :posts, only: [:new ,:create, :index, :show, :edit, :update, :destroy]
  root 'posts#index'
end
