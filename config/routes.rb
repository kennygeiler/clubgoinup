Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :users, only: [:index]

  resources :quotes, only: [:new, :create, :index, :show, :delete]
  resources :promotors, only: [:new, :create, :delete]

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]

  root to: "quotes#new"

end
