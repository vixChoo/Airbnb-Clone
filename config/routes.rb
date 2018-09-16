Rails.application.routes.draw do
<<<<<<< HEAD
  resources :reservations
  
  resources :listings
  root 'listings#home'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
=======

  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'
  root 'static#home'
  get "static/profile"
  get "static/random"

  # ADMIN
 resources :admin,only: [:index] do
  end
  
  get 'admin/users' => 'admin#users'
  get 'admin/listings' => 'admin#listings'
  get 'admin/reservations' => 'admin#reservations'
  get 'admin/tags' => 'admin#tags'

  get 'admin/users/:id/make_admin' => 'admin#make_admin', :as => "make_admin"
  get 'admin/users/:id/destroy_admin' => 'admin#destroy_admin', :as => "destroy_admin"
  # delete   'admin/listings/:id/destroy_listing' => 'admin#destroy_listing', :as => "destroy_listing"



  
>>>>>>> 8390f2a331652945e2910d6d6a7eb67ef22ed9d2

  get 'tags/:tag', to: 'listings#index', as: :tag


  resources :braintree
  post 'braintree/checkout'
  
  resources :reservations
  resources :listings
 
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users, only: [:create] do
   
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]


  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end 

