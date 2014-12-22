Ispec::Application.routes.draw do resources :projects

devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)

root 'data#one'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  get "quotations/index"
  get "quotations/show"
  get "quotations/build"
  get "quotations/request"
  get "quotations/add"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products  resources :projects
  resources :accounts
  resources :sections
  resources :subsections
  resources :copysubs
  resources :copysecs
  resources :products
  resources :globals
  resources :project_steps
  resources :trainings
  resources :favourites
  resources :quotes
  resources :lineitems
  resources :users
resources :installs
  get "projects/noprice"

  resources :projects do 
    member do 
      get :noprice 
      get :technoprice 
      get :tech 
      get :pdfnoprice 
      get :pdf 
    end 
  end



  get "users/delete"
  get "users/show"


  get "/welcome/index"
  #get "/welcome"
  get "/data/delete"
  get "data/show"
  get "data/list"
  get "data/delete"
  get "data/pdfnoprice"
  get "data/pdf"
  get "data/tech"
  get "data/technoprice"
  get "data/noprice"
  get "data/generate"
  get "data/one"
   get "data/addfav"
   get "data/addshow"

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
