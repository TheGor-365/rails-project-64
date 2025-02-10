# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/, defaults: { locale: 'ru' } do
    root 'pages#home'
    devise_for :users

    resources :posts do
      resources :comments, only: [:create]
    end
  end

  resources :likes, only: %i[create destroy]
end
