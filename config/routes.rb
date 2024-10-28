Rails.application.routes.draw do
  root 'pages#home'

  scope "(:locale)", locale: /en|ru/ do
    devise_for :users

    resources :posts do
      resources :comments, only: [:create]
    end
  end

  resources :likes, only: [:create, :destroy]
end
