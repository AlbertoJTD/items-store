# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: %i[new create destroy], path: '/login', path_names: { new: '/' }
  end

  resources :products
  resources :categories, except: :show
  resources :users, only: :show, path: '/user', param: :username
  resources :favorites, only: :create
end
