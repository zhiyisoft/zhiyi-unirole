Unirole::Engine.routes.draw do
  root to: 'organs#index'

  resources :ranks
  resources :organs
  resources :memberships
  resources :actors
  resources :users
end
