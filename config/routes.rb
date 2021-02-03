Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: 'romances#index'
  resources :romances do
    
    
    collection do
      get 'search'
    end

    member do
      get 'checked'
    end
    
    resources :comments 


    resources :likes, only: [:create, :destroy]

  end

end



