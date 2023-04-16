Rails.application.routes.draw do
  get 'order_items/index'
  get 'order_items/show'
  get 'order_items/new'
  get 'order_items/create'
  get 'order_items/edit'
  get 'order_items/update'
  get 'order_items/destroy'
  resources :products
  resources :orders
  devise_for :shop_owners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "orders#index"
end
