Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'
  
  resources :braintree
  post 'braintree/checkout'
  
  resources :reservations
  resources :listings


  root 'listings#home'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get 'tags/:tag', to: 'listings#index', as: :tag

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end 

