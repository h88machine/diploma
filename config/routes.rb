DemoApp::Application.routes.draw do

  get "events/new"
  get "events/create"
  get "events/show"
  get "events/index"
  get "events/destroy"
  get "events/calendar"

  get "orders/new"
  get "orders/create"
  get "orders/destroy"
  get "orders/show"

  get "place/create"
  get "place/index"
  get "place/destroy"
  get "place/manage"

  get "static_pages/home"
  get "static_pages/help"
	get "static_pages/about"
	get "static_pages/contact"
	get "static_pages/hall"

	match '/signup',  to: 'users#new'
	match '/signin',  to: 'sessions#new'
	#match '/sessions',  to: 'sessions#create'
	match '/signout', to: 'sessions#destroy', via: :delete
	#match '/edit',    to: 'users#edit'

	match '/help', to: 'static_pages#help'
	match '/about', to: 'static_pages#about'
	match '/contact', to: 'static_pages#contact'
  match '/hall', to: 'static_pages#hall'
  
  match '/add_place', to: 'places#new'
  match '/manage_places', to: 'places#manage'
  #match '/new_order', to: 'orders#new'


  resources :microposts, only: [:create, :destroy]
  resources :users
	resources :sessions, only: [:new, :create, :destroy]
	
	resources :events do
	   resources :places 
	end
	
	resources :places do
     resources :orders
  end
	


  root :to => 'static_pages#home'

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
