Railstore::Application.routes.draw do


  #resources :payment_notifications
  match "/payment_notifications/:id" => "payment_notifications#create", :as => :payment_notifications

  root :to => "home#index"
  get "home/index"
  get "admin/index"
  get "admin/unvisible"
  get "admin/makevisible"
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/searches/" => "items#index", :as => :search
  match "/items/destroy/:id" => "items#destroy", :as => :destroy
  match "/items/vote_up/:id" => "items#vote_up", :as => :thumbs_up
  match "/items/vote_down/:id" => "items#vote_down", :as => :thumbs_down
  match "/admin/" => "admin#index", :as => :admin
  match "/download/:id" => "items#download", :as => :download
  resources :items
  match "/message/reply" => "items#reply_message"
  match "/message/create" => "items#message_create", :as => :messages
  match "/my_items" => "items#my_items"
  match "/pay/:id" => "items#pay", :as => :setpaychained
  
  end
