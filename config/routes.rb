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


    post 'like/:id' => 'likes#create', as: 'create_like'

    # 以下の1行を追記
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  end

  get 'users', to: 'users#check'

end



