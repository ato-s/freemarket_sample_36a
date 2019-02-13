Rails.application.routes.draw do
  get 'descriptions/show'

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

  match 'dynamic_upper_category', to: 'items#dynamic_upper_category', via: [:get, :post]
  match 'dynamic_middle_category', to: 'items#dynamic_middle_category', via: [:get, :post]
  match 'dynamic_lower_category', to: 'items#dynamic_lower_category', via: [:get, :post]
  resources :items do
    resources :reviews, only: [:new, :create]
    resources :reports, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :transaction_messages, only: [:index, :create]
    resource :buy, only: [:edit,:update]
    resources :information, only: [:create]
  end

  resources :groups, only: [:show]
  resources :brands, only: [:show]

  resources :upper_categories, only: [:index, :show]
  resources :middle_categories, only: [:show]
  resources :lower_categories, only: [:show]
  resources :area ,onl: [:show]

  get 'logout' => 'mypages#logout'
  get 'index_todos' => 'mypages#index_todos'
  get 'index_information' => 'mypages#index_information'
  get 'index_under_transaction_items' => 'mypages#index_under_transaction_items'
  get 'index_sold_out_items' => 'mypages#index_sold_out_items'
  resources :mypages, only: [:index, :show, :edit, :update]
  resources :likes, only: [:index]
  resources :reviews, only: [:index, :show]
  resources :addresses, only: [:index, :new, :create, :edit, :update]
  resources :phone_numbers, only: [:new, :create, :edit, :update]
  resources :credits, only: [:new, :create, :destroy, :index]

  resource :safe, only: [:show] do
    resource :description,only: [:show]
  end

end
