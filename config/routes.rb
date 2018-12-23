Rails.application.routes.draw do
  resources :reviews
  resources :transactions
  resources :items
  resources :groups
  resources :lower_categories
  resources :middle_categories
  resources :upper_categories
  resources :brands
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'viewtest#index'
end
