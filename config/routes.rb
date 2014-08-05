Rails.application.routes.draw do
  devise_for :users, :controllers => 
  { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  get 'invites/:token' => 'registrations#create'
  get 'invites/:token' => 'group#add'
  get 'group/:id' => 'groups#index'
  post 'match/:id/evaluate_for_match' => 'matches#evaluate_for_match', as: 'evaluate_for_match'
  post 'match/evaluate_all_matches' => 'matches#evaluate_all_matches', as: 'evaluate_all_matches'
  resources :mailer
  resources :groups
  resources :about
  resources :matches
  resources :bets
  resources :tournaments
  resources :users do
    get "new"
  end
  resources :groups do
    get 'add'
  end

  resources :groups do
    get 'add_tournament'
  end

  resources :tournaments do
    get 'addmatch'
  end

  resources :invites

 	root 'users#index'
end

