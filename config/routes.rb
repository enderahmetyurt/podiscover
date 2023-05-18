# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  get "comment/index"
  get "category/index"
  mount RailsAdmin::Engine => "/admin", :as => "rails_admin"
  authenticate :user, lambda { |u| u.is_admin? } do
    mount Sidekiq::Web => "/sidekiq"
    mount ActiveAnalytics::Engine, at: "analytics"
  end

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :podcasts, only: %i[index show] do
    get :search, on: :collection
    resources :episodes, only: %i[show index] do
      resources :comments
      patch :like, to: "episodes#like"
      patch :dislike, to: "episodes#dislike"
      patch :marked_as_listened, to: "episodes#marked_as_listened"
      patch :marked_as_unlistened, to: "episodes#marked_as_unlistened"
    end
  end

  resources :dashboard, only: [:index]

  resources :users, only: %i[index show] do
    member do
      get :following, :followers
      get :email_confirmation
      post :allow_email_confirmation
      post :deny_email_confirmation
    end
    collection do
      get :tigers
    end
  end

  resources :relationships, only: %i[create destroy]
  resources :subscriptions, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :activities, only: %i[index], path: "feed"
  resources :discovers, only: %i[index], path: "discover" do
    get :advice, on: :collection
    get :all_responses, on: :collection
  end

  root "home#index"
end
