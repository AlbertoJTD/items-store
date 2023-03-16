# frozen_string_literal: true

Rails.application.routes.draw do
  root "products#index"
  
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :products
  resources :categories, except: :show
end
