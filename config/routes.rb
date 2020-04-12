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
  root to: 'products#index'
  # get 'categories/index'
  # get 'categories/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
