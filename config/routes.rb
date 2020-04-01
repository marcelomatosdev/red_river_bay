# frozen_string_literal: true

Rails.application.routes.draw do
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  get 'categories/index'
  get 'categories/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
