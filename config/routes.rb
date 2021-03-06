Rails.application.routes.draw do

  resources :messages, module: 'chatroom'

  resources :messages, module: 'chatroom'

  #root routes
 root "site#index"

 #User routes
 get "/signup", to: "users#new"
 get "/users/:id", to: "users#show", as: 'profile'

 put "/status", to: "users#status"
 put "/ping", to: "socket#ping"
 put "/pong", to: "socket#pong"

 resources :users, only: [:create, :edit, :update, :show]

 # Sessions routes
 get "/login", to: "sessions#new"
 post "/logout", to: "sessions#destroy"
 resources :sessions, only: [:create]
 
end
