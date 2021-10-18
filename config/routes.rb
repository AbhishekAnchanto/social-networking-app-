# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'pages#about'
  resources :posts # only: [:show, :index, :new , :create ,:edit, :update]
  get 'signup', to: 'users#new'
  # resources :users, except: [:new]
  resources :users, only: %i[show index]
  resources :comments, only: %i[new create]
  root to: 'pages#home'
  get 'search', to: 'users#search'
end
