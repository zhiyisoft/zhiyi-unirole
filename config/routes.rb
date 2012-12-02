Unirole::Engine.routes.draw do 

  root :to => "dashboard#index"
  resources :organs, :only => [:index,:create,:destroy,:update] do
    collection do
      get "get_parent"
    end
  end
  resources :rank, :only=> [:index,:create,:destroy,:update]
  resources :membership, :only=> [:index,:create,:destroy,:update]
  resources :user, :only=> [:index]
  resources :actor, :only=> [:index,:create,:destroy,:update] do
    collection do 
      get "add_user"
    end
  end
end
