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
  resources :users do
    get "new"
  end

  resources :groups do
    get "sendmail"
  end

  resources :invites

 	root 'users#index'
end

