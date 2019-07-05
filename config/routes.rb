Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to => "categories#index"
  resources :categories ,only: [:index] do
    resources :products ,only: [:index]
  end
  get "/cart" => "order_items#index"
  get "/orders" => "orders#index"

  resources :order_items ,path: "/cart/items"
  post "/checkout" => "orders#create"
end
