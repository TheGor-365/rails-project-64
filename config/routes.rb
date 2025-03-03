# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  scope '(:locale)', locale: /en|ru/, defaults: { locale: 'ru' } do
    
    devise_for :users

    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  resources :likes, only: %i[create destroy]
end
