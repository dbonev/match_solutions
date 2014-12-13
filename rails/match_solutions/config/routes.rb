Rails.application.routes.draw do
  get 'qlibri/index'

  get 'qlibri/portfolio'

  get 'qlibri/contacts'

  get 'pages/home', :as => :pages

  get '/not_found', :to => redirect('/404.html'), :as => :not_found

  get 'pages/about'

  get 'pages/contact'

  get 'pages/faq', :as => :faq

  get 'sessions/new'

  get 'users/show', :as => :user_show
  resources :users

  resources :subcontractors

  get 'projects/success' => 'projects#success', :as => :project_success
  resources :projects

  get    'login'   => 'sessions#new', :as => :login
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy', :as => :logout
  get 	 'logout'  => 'sessions#logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
