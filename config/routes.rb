Rails.application.routes.draw do
  devise_for :users


  get 'group/:id' => 'groups#index'

  resources :groups
  resources :groups do
  	get "adduser"
  end

  root 'users#index'
end

