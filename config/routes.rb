# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'courses#index'

  namespace :admin do
    resources :users, only: [:index]
  end

  resources :courses, only: %i[index show]
  resources :lessons, only: [:show]
  get '/my_courses' => 'subscriptions#index', :as => :user_root
  resources :subscriptions, only: %i[index update]
  resources :users, only: %i[edit update]


  # FIX ME
  # devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
end
