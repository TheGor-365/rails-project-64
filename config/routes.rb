# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#index'
    devise_for :users

    resources :posts, only: %i[new create show] do
      resources :comments, only: :create
    end
    resources :likes, only: %i[create destroy]
  end
end
