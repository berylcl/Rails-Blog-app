Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [] do
    resources :posts, only: %i[index show], module: :users
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
