Rails.application.routes.draw do
  resources :posts, only: [:new, :show]
  devise_for :users
  root "pages#home"
end
