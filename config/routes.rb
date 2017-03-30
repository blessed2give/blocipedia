Rails.application.routes.draw do
  resources :charges, only: [:new, :create, :destroy]
  resources :wikis
  resources :collaborations, only: [:create, :destroy]
  get 'about', to: 'welcome#about'
  devise_for :users
  resources :users, only: [:show]
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  root 'welcome#index'
end
