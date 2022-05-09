# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'passwords' }

  root to: 'courses#index'

  namespace :admin do
    resources :users
  end

  resources :courses, only: %i[index show]
  resources :topics, only: %i[index show]
  resources :lessons, only: [:show]
  resources :lessons do
    resources :materials, shallow: true
  end

  get '/my_courses' => 'subscriptions#index', :as => :user_root
  resources :subscriptions, only: %i[index update]
  resources :users, only: %i[edit update]

  # FIX ME
  # devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
end
