Rails.application.routes.draw do
  root 'viewtest#index'
  devise_for :users

  resources :items do
    resources :reviews
    resources :reports, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :update, :destroy]
    resources :buys, only: [:index]
    resources :transaction_messages
  end

  resources :groups, only: [:show, :index] do
    resources :brands, only: [:show]
  end

  resources :upper_categories, only: [:show] do
    resources :middle_categories, only: [:show] do
      resources :lower_categories, only: [:show]
    end
  end
end
