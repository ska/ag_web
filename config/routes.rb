AgWeb::Application.routes.draw do 
  root :to => "pages#index"
  
  
  resources :messages, :only => [:create]
  resources :pages, :only => [:index] do
    member do 
      get :house
      get :photo
    end
    collection do
      get :chi_siamo
    end  
  end
  
  namespace :admin do
    root :to => "sessions#new"    
    match '/signout', :to => 'sessions#destroy'
    match '/signin', :to => 'sessions#new'   
    
    resources :users do
      member do
        get :edit_permission
        put :update_permission
      end
    end
    
    resources :images    
    resources :sessions, :only => [:new, :create, :destroy]
    
    resources :messages, :except => [:new, :create, :edit, :update] do
      collection do
        get :admin_index
      end
      member do 
        get :user_index
      end
    end
    
    resources :settings, :only => [:index] do
      collection do        
        get :new_contract
        post :save_contract     
        get :new_house
        post :save_house  
        get :new_condition
        post :save_condition
      end
    end
        
    resources :houses do
      member do 
        get :user
      end
    end        
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
