Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'romances#index'
  resources :romances do
    
    
    collection do
      get 'search'
    end

    member do
      get 'kaiketu'
    end

    member do
      get 'checked'
    end
    
    resources :comments 



  end

  post 'like/:id' => 'likes#create', as: 'create_like'

  # 以下の1行を追記
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  get 'users', to: 'users#check'


  
end



