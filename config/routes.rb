Rails.application.routes.draw do
  devise_for :users, :controllers => 
  { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  get 'invites/:token' => 'registrations#create'
  get 'invites/:token' => 'group#add'
  get 'group/:id' => 'groups#index'
  post 'match/:id/evaluate_for_match' => 'matches#evaluate_for_match', as: 'evaluate_for_match'
  resources :mailer
  resources :groups
  resources :matches
  resources :bets
  resources :users do
    get "new"
  end



  resources :invites

 	root 'users#index'
end

