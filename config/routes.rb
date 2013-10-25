PocketReview::Application.routes.draw do

  #get "/aboutus", to: 'static_pages#about_us', as: :about_us
  match "/about_us", to: 'static_pages#about_us', via: "get"
  root to: "static_pages#welcome"

  resources :static_pages
  resources :clients do
    collection do
      post :reset_password
    end
  end

  put "clients/:id/active" => 'clients#active', as: :client_active
  put "clients/:id/deactive" => 'clients#deactive', as: :client_deactive

  resources :sessions, only: [:new, :create, :destroy]

  #devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "passwords"}
  devise_for :users
  match "users/index", to: 'users#index', via: "get"
  post "clients/update_password" => 'clients#update_password', as: :update_password
  get "clients/reset_password" => 'clients#reset_password', as: :reset_password
  post "admins/update_password" => 'admins#update_password', as: :update_password

  resources :users do
    collection do
      get :changepassword
      post :update_password
    end
  end
  resources :admins do
    collection do
      get :manage_passwords
      get :reset_password
    end
  end

  get '/manage_clients' => 'clients#index', as: :manage_clients

  #devise_scope :user do
  #  get "/login" => "devise/sessions#new"
  #end

  #match "users/index", to: 'device/sessions#index', via: 'get'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
