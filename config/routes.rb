Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'directory/', to: 'profiles#index'

  get 'admin/index'

  patch 'admin/update'

  delete 'admin/destroy'

  get 'schedules/index'

  get 'schedules/test'

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

end
