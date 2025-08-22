# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  scope '(:locale)', locale: /en|ru/, defaults: { locale: 'ru' } do
    devise_for :users

    resources :posts do
      resources :comments, only: [:create]
    end
    resources :likes, only: %i[create destroy]
    resources :post_likes, only: %i[create destroy], controller: :likes
  end
end
