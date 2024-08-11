Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  resources :posts do
    resources :comments, only: [:new, :create]
  end
end
