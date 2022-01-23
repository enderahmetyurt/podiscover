Rails.application.routes.draw do
  devise_for :users
  resources :podcasts

  root 'podcasts#index'
end
