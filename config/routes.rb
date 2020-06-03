Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root "users#show"
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :foods, only: [:new, :create, :index]
  resources :groups, only: [:new, :create, :index, :show]
end
