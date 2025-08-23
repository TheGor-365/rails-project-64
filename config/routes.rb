# frozen_string_literal: true

Rails.application.routes.draw do
  # --- БАЗОВЫЕ (без :locale) — это то, на что опираются школьные тесты ---
  resources :posts, only: %i[new create show] do
    resources :comments, only: :create
  end

  # --- Локализованные алиасы страниц постов (для UX по /en/...) ---
  scope '(:locale)' do
    resources :posts, only: %i[new show create], as: :localized_posts

    resources :likes, only: %i[create destroy]
    root 'pages#home'
    devise_for :users
  end
end
