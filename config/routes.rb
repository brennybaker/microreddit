Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'devise/passwords'
  }

  root to: 'home#index'
  
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
