Rails.application.routes.draw do
  devise_for :users, :controllers => 
  { :omniauth_callbacks => "users/omniauth_callbacks" }


  get 'group/:id' => 'groups#index'

  resources :groups
  resources :bets

  root 'users#index'
end

