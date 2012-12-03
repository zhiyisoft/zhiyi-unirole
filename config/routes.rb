Unirole::Engine.routes.draw do 

  root :to => "dashboard#index"
  resources :organs, :only => [:index,:create,:destroy,:update] do
    collection do
      get "get_parent"
    end
  end
  resources :ranks, :only=> [:index,:create,:destroy,:update]
  resources :memberships, :only=> [:index,:create,:destroy,:update]
  resources :users, :only=> [:index]
  resources :actors, :only=> [:index,:create,:destroy,:update] do
      get "add_user"
      get "add_user_for_actor"
      get "get_user"
  end
end
