Rails.application.routes.draw do
 
  root 'events#index'
  devise_for :users
  resources :events, only: [:show, :new, :create, :index, :edit, :destroy]
  resources :users, only: [:show]
  resources :participations, only: [:new, :create, :index]
  resources :charges
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
