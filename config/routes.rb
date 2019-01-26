Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :omniauth_callbacks => 'users/omniauth_callbacks',
  :sessions => 'users/sessions'
}
  devise_scope :user do
    get 'select_api' => 'users/registrations#select_api'
    get 'complete' => 'users/registrations#complete'
  end

  resources :items do
    resources :reviews
    resources :reports, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :update, :destroy]
    resources :transaction_messages
  end

  resources :groups, only: [:show, :index] do
    resources :brands, only: [:show]
  end

  resources :upper_categories, only: [:index, :show]
  resources :middle_categories, only: [:show]
  resources :lower_categories, only: [:show]

  resource :transactions do
    resources :buys
    resources :addresses
    resources :credits
  end

  get 'logout' => 'mypages#logout'
  resources :mypages, only: [:index, :show, :edit]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :phone_numbers, only: [:new, :create, :edit, :update]

end
