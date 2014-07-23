Rails.application.routes.draw do
  devise_for :users


  get 'group/:id' => 'groups#index'

  resources :groups
  resources :matches
 	resources :bets
	root 'users#index'
end

