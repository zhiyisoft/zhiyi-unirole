Unirole::Engine.routes.draw do 

  root :to => "dashboard#index"
  resources :organs, :only => [:index,:create,:destroy,:update] do
    collection do
      get "get_parent"
      get "tree"
    end
  end

  resources :ranks, :only=> [:index,:create,:destroy,:update]
  resources :memberships, :only=> [:index,:create,:destroy,:update]
  resources :users do
    member do 
      get :resetpass
    end
  end

  resources :members,:only => [:index,:new,:edit,:create,:update,:destroy] do
    collection do 
      get 'password'
      post 'reset_password'
    end
  end
  
  resources :actors, :only=> [:index,:create,:destroy,:update]
end
