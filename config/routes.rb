# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :podcasts, only: %i[index show] do
    get 'all', on: :collection
  end
  resources :dashboard, only: [:index]
  resources :users, only: %i[index show] do
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
