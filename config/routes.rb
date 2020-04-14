# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/index'
  # get 'contacts/index'
  # get 'abouts/index'
  # get 'abouts/show'
  # get 'products/index'
  # get 'products/show'
  # get 'users/index'
  # get 'users/show'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', id: /\d+/, as: 'user'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show', id: /\d+/, as: 'product'
  get '/about', to: 'abouts#index'
  get '/contact', to: 'contacts#index'
  get '/searchproduct', to: 'products#search', as: 'searchproduct'
  get '/newproducts', to: 'products#new_products', as: 'newproducts'
  get '/updateproducts', to: 'products#update_products', as: 'updateproducts'
  get '/searchbycategories/:id/', to: 'category#search_by_categories', id: /\d+/, as: 'searchbycategories'

  get '/orders', to: 'orders#index'
  post '/orders/add_to_cart/:id', to: 'orders#add_to_cart', as: 'add_to_cart'
  delete '/orders/remove_from_cart/:id', to: 'orders#remove_from_cart', as: 'remove_from_cart'
  get '/orders', to: 'orders#select_province', as: 'select_province'
  get '/orders/pre_checkout', to: 'orders#pre_checkout', as: 'pre_checkout'
  post '/orders/pre_checkout', to: 'orders#pre_checkout_post', as: 'pre_checkout_post'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success' # 20:54 time youtube video
  end

  root to: 'products#index'
  # get 'categories/index'
  # get 'categories/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
