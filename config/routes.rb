Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  resources :users

  resources :quotes, only: [:new, :create, :index, :show, :delete]
  resources :promotors, only: [:new, :create, :delete]

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]

  root to: "sessions#new"

  match '*any' => 'application#options', :via => [:options]

end
