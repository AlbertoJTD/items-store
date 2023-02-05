# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  root "products#index"
  resources :products
end
