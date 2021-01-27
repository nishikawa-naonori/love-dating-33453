Rails.application.routes.draw do
  devise_for :users
  root to: 'loves#index'
  resources :loves do
    resources :comments, only: :create
  end
end
