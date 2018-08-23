Rails.application.routes.draw do

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

  post 'admin/users/:id/make_admin' => 'admin#make_admin', :as => "make_admin"
  post 'admin/users/:id/destroy_admin' => 'admin#destroy_admin', :as => "destroy_admin"
  # delete   'admin/listings/:id/destroy_listing' => 'admin#destroy_listing', :as => "destroy_listing"



  

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

