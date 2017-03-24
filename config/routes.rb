Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  resources :users, only: [:show]
  resources :wikis
  get 'about', to: 'welcome#about'
  devise_for :users

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  root 'welcome#index'
end
