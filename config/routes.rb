Rails.application.routes.draw do
  get 'home/about'
  root 'posts#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :posts, only: [:new ,:create, :index, :show]
end
