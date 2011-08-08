Bb::Application.routes.draw do
  get 'admin' => "admin#index"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
    delete 'logout' => :destroy
  end

  get "cart/show"

  resources :orders
  resources :line_items
  resources :carts
  resources :slides
  resources :categories
  resources :products
  resources :users
  resources :sessions

  match 'rahmen' => 'categories#show', :id => 1, :as => :rahmen
  match 'schaltwerke' => 'categories#show', :id => 3, :as => :schaltwerke
  match 'tuning' => 'categories#show', :id => 4, :as => :tuning
  match 'konfigurator' => 'categories#show', :id => 5, :as => :konfigurator
  match 'shop' => 'categories#show', :id => 6, :as => :shop
  match 'haendler' => 'categories#show', :id => 7, :as => :haendler

  match 'register' => 'users#new'

  root :to => 'pages#home'
end
