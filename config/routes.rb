Unirole::Engine.routes.draw do 

  root :to => "dashboard#index"
  resources :organs,:only=>[:index]
  resources :rank
end
