Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users do
    resources :posts do
      resource :likes, only: %i[create destroy]
    end
  end
  resources :users do
    resources :posts do
      resources :comments, only: [:create]
    end
  end
  resources :users do
    resources :posts do
      resources :comments, only: %i[new create] # Add :new here
    end
  end

  resources :posts do
    member do
      post :add_like
      delete :unlike
    end
  end

  resources :users do
    resources :posts do
      member do
        post :like
        delete :unlike
      end
    end
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
