Rails.application.routes.draw do

  #root routes
 root "site#index"

 #User routes
 get "/signup", to: "users#new"
 get "/users/:id", to: "users#show", as: 'profile'

 put "/status", to: "users#status"

 resources :users, only: [:create, :edit, :update, :show]

 # Sessions routes
 get "/login", to: "sessions#new"
 post "/logout", to: "sessions#destroy"
 resources :sessions, only: [:create]
 
end
