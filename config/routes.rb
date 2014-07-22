Rails.application.routes.draw do
  devise_for :users


  get 'group/:id' => 'groups#index'

  resources :groups

  root 'users#index'
end

