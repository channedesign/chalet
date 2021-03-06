Rails.application.routes.draw do


  # namespace :fr do
  # get 'hibou/index'
  # end
  #
  # namespace :fr do
  # get 'panda/index'
  # end
  #
  # namespace :fr do
  # get 'hideaway2/index'
  # end
  #
  # namespace :fr do
  # get 'hideaway1/index'
  # end

  namespace :fr do
    get 'home', to: 'home#index'
    get 'hideawayI', to: 'hideaway1#index'
    get 'hideawayII', to: 'hideaway2#index'
    get 'panda', to: 'panda#index'
    get 'hibou', to: 'hibou#index'
  end

  root "home#index"
  get 'hideawayI', to: 'hideaway1#index'
  get 'hideawayII', to: 'hideaway2#index'
  get 'panda', to: 'panda#index'
  get 'hibou', to: 'hibou#index'




  get 'admin', to: 'admins#index'
  devise_for :admins

  scope 'admin' do
    resources :houses do
      collection { post :sort }
    end
    resources :pictures do
      collection { delete :delete_all }
      collection { post :sort }
    end
    resources :floor_plans do
      collection { delete :delete_all }
      collection { post :sort }
    end

    resources :pricings
    resources :weeks do
      collection { post :sort }
    end
    resources :months do
      collection { post :sort }
    end
    resources :appartments do
      collection { post :sort }
    end
  end


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
