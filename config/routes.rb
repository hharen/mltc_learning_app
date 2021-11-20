# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  namespace :admin do
    resources :users, only: [:index]
  end

  resources :courses, only: %i[index show]
  resources :lessons, only: [:show]
  resources :my_courses, only: [:index]
  get '/my_courses' => 'my_courses#index', :as => :user_root
  resources :users, only: %i[edit update]

  # FIX ME
  # devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
end
