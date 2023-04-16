Rails.application.routes.draw do
  resources :orders
  devise_for :shop_owners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "orders#index"
end
