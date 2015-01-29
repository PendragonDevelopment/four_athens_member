Rails.application.routes.draw do

  mount StripeEvent::Engine => '/stripe'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'directory/', to: 'profiles#index'

  get 'admin/index'

  patch 'admin/update'

  delete 'admin/destroy'

  get 'schedules/index'

  get 'schedules/test'

  resources :subscriptions do
    member do
      patch :update_card
    end
  end


  resources :mentors do
    collection do
      post :create_slots
    end  
    member do
      delete :destroy_slots
      patch :update_slots
      patch :release_slots
    end
  end


  resources :posts do
    collection do
      get :hiring
      get :promote
      get :launch
      get :tools
      get :request_thing
      get :event
    end
  end

  resources :skills do
    collection { post :sort }
  end
  
  resources :profiles
  resources :comments


  root "posts#index"

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
