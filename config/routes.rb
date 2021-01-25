Rails.application.routes.draw do
  devise_for :users
  root to: 'loves#index'
  resources :loves, only: [:index]
end
