# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    root 'pages#home'

    resources :posts, only: %i[index show new create] do
      resources :comments, only: :create
    end

    resources :likes, only: %i[create destroy], controller: 'likes'
    resources :post_likes, only: %i[create destroy], controller: 'likes'
  end
end
