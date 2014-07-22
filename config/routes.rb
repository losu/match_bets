Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  resources :groups
  resources :bets

end

