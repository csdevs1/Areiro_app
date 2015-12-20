Rails.application.routes.draw do
  get 'search/show', as: :search

    root 'home#index'
    get '/products/index' => 'products#index', as: :admin
    get '/products/:id' => 'products#show', as: :product
    get 'new' => 'products#new', as: :add
    get ':id/edit' => 'products#edit', as: :edit
    patch '/products/:id' => 'products#update'
    resources :products do
        member { get :delete }
    end
    
    get '/videos/index' => 'videos#index', as: :videos
    get '/videos/:id' => 'videos#show', as: :video
    get 'video' => 'videos#new', as: :addVideo
    post '/videos/index' => 'videos#create'
    resources :videos do
        member { get :delete }
    end
    
    get '/category/:id' => 'categories#show', as: :category
    get '/subcategory/:id' => 'subcategories#show', as: :subcategory
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
