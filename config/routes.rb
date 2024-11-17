Rails.application.routes.draw do
  root 'pages#home'

  scope '(:locale)', locale: /en|ru/, defaults: { locale: 'ru' } do
    devise_for :users

    resources :posts do
      resources :comments, only: [:create]
    end
  end

  resources :likes, only: %i[create destroy]
end
