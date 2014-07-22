Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'group/:id' => 'groups#index'

  resources :groups


end

