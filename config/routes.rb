# frozen_string_literal: true

Rails.application.routes.draw do
  root "products#index"
  resources :products
  resources :categories, except: :show

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
end
