# frozen_string_literal: true

Rails.application.routes.draw do
  # БАЗОВЫЕ без :locale — под школьные тесты
  resources :posts, only: %i[new create show] do
    resources :comments, only: :create
    resources :likes, only: %i[create destroy]
  end

  # Локализованные алиасы (UX по /en/...), плоские лайки оставляем для текущего UI
  scope '(:locale)' do
    resources :posts, only: %i[new show create], as: :localized_posts
    resources :likes, only: %i[create destroy]

    root 'pages#home'
    devise_for :users
  end
end
