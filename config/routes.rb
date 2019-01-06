Rails.application.routes.draw do
  root 'viewtest#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'viewtest#login'
    get 'signup', to: 'viewtest#signup'
    get 'signup/registration', to: 'viewtest#signup_registration'
  end

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
