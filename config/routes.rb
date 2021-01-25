Rails.application.routes.draw do
  root to: 'loves#index'
  resources :loves, only: [:index]
end
