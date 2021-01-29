Rails.application.routes.draw do
  devise_for :users
  root to: 'romances#index'
  resources :romances do
    resources :comments
    collection do
      get 'search'
    end
  end
end
