Rails.application.routes.draw do
  devise_for :users, :controllers => 
  { :omniauth_callbacks => "users/omniauth_callbacks" }


  get 'group/:id' => 'groups#index'
  resources :mailer
  resources :groups
  resources :matches
  resources :bets
  resources :groups do
  	get "adduser"
  end

 	root 'users#index'
end

