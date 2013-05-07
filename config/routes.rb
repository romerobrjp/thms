Scgc::Application.routes.draw do

  get "reports/monthly"

  root :to => 'home#index'
  match 'about' => 'home#about', as: 'about'

  resources :answers, only: [:create, :destroy]
  resources :cities, only: [:index, :show]
  resources :states, only: [:index, :show]

  devise_for :users, :skip => :registrations

  # namespace :admin do
  #   resources :admins
  #   resources :tenants
  #   resources :cities
  #   resources :states
  #   match '/' => 'home#index', :as => :home
  # end

  namespace :syndic do

    match 'me' => 'me#show', :as => :me, :via => :get
    match 'me/edit' => 'me#edit', :as => :edit_me, :via => :get
    match 'me' => 'me#update', :as => :update_me, :via => :put

    resources :tenants, only: [:index, :show, :new, :create]
    resources :townhouses, only: [:index, :show, :edit, :update] do
      resources :calls, only: [:index, :show]
      match '/calls/:id/accept' => 'calls#accept', as: 'accept_call'
      match '/calls/:id/reject' => 'calls#reject', as: 'reject_call'
      resources :bulletins
      match '/bulletins/:id/publish' => 'bulletins#publish', as: 'publish_bulletin'
      resources :tenements
      resources :expense_types
      resources :income_types
      resources :incomes
      resources :expenses
    end
    match '/' => 'home#index', :as => :home
  end

  namespace :tenant do
    match '/' => 'home#index', :as => :home

    match 'me' => 'me#show', :as => :me, :via => :get
    match 'me/edit' => 'me#edit', :as => :edit_me, :via => :get
    match 'me' => 'me#update', :as => :update_me, :via => :put

    resources :tenements, only: [:index, :show] do
      resources :bulletins, only: [:index, :show]
      resources :calls
      match '/calls/:id/publish' => 'calls#publish', as: 'call_publish'
    end
  end

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


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
