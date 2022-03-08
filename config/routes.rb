# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :podcasts, only: %i[index show]
  resources :dashboard, only: [:index]
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
    collection do
      get :tigers
    end
  end
  resources :relationships, only: %i[create destroy]

  root 'home#index'
end
