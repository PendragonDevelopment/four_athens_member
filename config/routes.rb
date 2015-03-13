# == Route Map
#
#                   Prefix Verb   URI Pattern                          Controller#Action
#         new_user_session GET    /users/sign_in(.:format)             devise/sessions#new
#             user_session POST   /users/sign_in(.:format)             devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
#            user_password POST   /users/password(.:format)            devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)        devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)       devise/passwords#edit
#                          PATCH  /users/password(.:format)            devise/passwords#update
#                          PUT    /users/password(.:format)            devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)              registrations#cancel
#        user_registration POST   /users(.:format)                     registrations#create
#    new_user_registration GET    /users/sign_up(.:format)             registrations#new
#   edit_user_registration GET    /users/edit(.:format)                registrations#edit
#                          PATCH  /users(.:format)                     registrations#update
#                          PUT    /users(.:format)                     registrations#update
#                          DELETE /users(.:format)                     registrations#destroy
#   accept_user_invitation GET    /users/invitation/accept(.:format)   devise/invitations#edit
#   remove_user_invitation GET    /users/invitation/remove(.:format)   devise/invitations#destroy
#          user_invitation POST   /users/invitation(.:format)          devise/invitations#create
#      new_user_invitation GET    /users/invitation/new(.:format)      devise/invitations#new
#                          PATCH  /users/invitation(.:format)          devise/invitations#update
#                          PUT    /users/invitation(.:format)          devise/invitations#update
#                directory GET    /directory(.:format)                 profiles#index
#              admin_index GET    /admin/index(.:format)               admin#index
#             admin_update PATCH  /admin/update(.:format)              admin#update
#            admin_destroy DELETE /admin/destroy(.:format)             admin#destroy
#          schedules_index GET    /schedules/index(.:format)           schedules#index
#           schedules_test GET    /schedules/test(.:format)            schedules#test
#     create_slots_mentors POST   /mentors/create_slots(.:format)      mentors#create_slots
#     destroy_slots_mentor DELETE /mentors/:id/destroy_slots(.:format) mentors#destroy_slots
#      update_slots_mentor PATCH  /mentors/:id/update_slots(.:format)  mentors#update_slots
#     release_slots_mentor PATCH  /mentors/:id/release_slots(.:format) mentors#release_slots
#                  mentors GET    /mentors(.:format)                   mentors#index
#                          POST   /mentors(.:format)                   mentors#create
#               new_mentor GET    /mentors/new(.:format)               mentors#new
#              edit_mentor GET    /mentors/:id/edit(.:format)          mentors#edit
#                   mentor GET    /mentors/:id(.:format)               mentors#show
#                          PATCH  /mentors/:id(.:format)               mentors#update
#                          PUT    /mentors/:id(.:format)               mentors#update
#                          DELETE /mentors/:id(.:format)               mentors#destroy
#             hiring_posts GET    /posts/hiring(.:format)              posts#hiring
#            promote_posts GET    /posts/promote(.:format)             posts#promote
#             launch_posts GET    /posts/launch(.:format)              posts#launch
#              tools_posts GET    /posts/tools(.:format)               posts#tools
#      request_thing_posts GET    /posts/request_thing(.:format)       posts#request_thing
#              event_posts GET    /posts/event(.:format)               posts#event
#                    posts GET    /posts(.:format)                     posts#index
#                          POST   /posts(.:format)                     posts#create
#                 new_post GET    /posts/new(.:format)                 posts#new
#                edit_post GET    /posts/:id/edit(.:format)            posts#edit
#                     post GET    /posts/:id(.:format)                 posts#show
#                          PATCH  /posts/:id(.:format)                 posts#update
#                          PUT    /posts/:id(.:format)                 posts#update
#                          DELETE /posts/:id(.:format)                 posts#destroy
#              sort_skills POST   /skills/sort(.:format)               skills#sort
#                   skills GET    /skills(.:format)                    skills#index
#                          POST   /skills(.:format)                    skills#create
#                new_skill GET    /skills/new(.:format)                skills#new
#               edit_skill GET    /skills/:id/edit(.:format)           skills#edit
#                    skill GET    /skills/:id(.:format)                skills#show
#                          PATCH  /skills/:id(.:format)                skills#update
#                          PUT    /skills/:id(.:format)                skills#update
#                          DELETE /skills/:id(.:format)                skills#destroy
#                 profiles GET    /profiles(.:format)                  profiles#index
#                          POST   /profiles(.:format)                  profiles#create
#              new_profile GET    /profiles/new(.:format)              profiles#new
#             edit_profile GET    /profiles/:id/edit(.:format)         profiles#edit
#                  profile GET    /profiles/:id(.:format)              profiles#show
#                          PATCH  /profiles/:id(.:format)              profiles#update
#                          PUT    /profiles/:id(.:format)              profiles#update
#                          DELETE /profiles/:id(.:format)              profiles#destroy
#                 comments GET    /comments(.:format)                  comments#index
#                          POST   /comments(.:format)                  comments#create
#              new_comment GET    /comments/new(.:format)              comments#new
#             edit_comment GET    /comments/:id/edit(.:format)         comments#edit
#                  comment GET    /comments/:id(.:format)              comments#show
#                          PATCH  /comments/:id(.:format)              comments#update
#                          PUT    /comments/:id(.:format)              comments#update
#                          DELETE /comments/:id(.:format)              comments#destroy
#                     root GET    /                                    posts#index
#

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
