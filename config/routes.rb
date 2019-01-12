Rails.application.routes.draw do
  root 'viewtest#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'viewtest#login'
    get 'signup', to: 'viewtest#signup'
    get 'signup/registration', to: 'viewtest#signup_registration'
    get 'logout', to: 'viewtest#logout'
  end

  get 'sell', to: 'viewtest#sell'
  get 'item-id', to: 'viewtest#item_id'
  get 'transaction/buy/id', to: 'viewtest#transaction_buy_id'
  get 'transaction/address/id/', to: 'viewtest#transaction_address_id'
  get 'transaction/card/id/', to: 'viewtest#transaction_card_id'
  get 'transaction/select_card/id/', to: 'viewtest#transaction_selectcard_id'

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

  resources :mypage, only: [:index]
  get 'mypage/profile', to: 'mypage#profile'
  get 'mypage/identification', to: 'mypage#identification'
  get 'mypage/card', to: 'mypage#card'
end
