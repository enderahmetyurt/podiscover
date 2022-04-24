# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticate :user, lambda { |u| u.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :podcasts, only: %i[index show] do
    resources :episodes, only: %i[show]
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
  resources :subscriptions, only: %i[index show]

  root 'home#index'
end
