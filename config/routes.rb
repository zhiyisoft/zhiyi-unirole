Unirole::Engine.routes.draw do 
  root :to => 'dashboard#index'
  resources :ranks
  resources :organs
  resources :memberships
  resources :actors
  resources :users
end
