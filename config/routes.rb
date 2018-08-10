Rails.application.routes.draw do
  resources :listings
  root 'listings#index'
  get 'listings/index'
  get 'listings/show'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end 

