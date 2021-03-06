Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  root "welcome#index"
  resources :users, controller: "users", only: [:create, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

 resources :listings do 
   resources :reservations
  end 

  resources :users 
    # resources :listings, only: [:create, :new, :edit, :destroy, :show]



  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "verification/:id" => "listings#verify", as: "verify"
  post "/listings/:listing_id/reservations/:id" => "reservations#destroy", as: "delete"
  post "/listings/:listing_id/reservations/:id/checkout" => "reservations#checkout", as: "checkout"

 post "/search"  => "listings#search"

  get 'braintree/new'
  post 'braintree/checkout'
  post 'braintree/new'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

