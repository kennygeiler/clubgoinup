Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
    resources :venues, only: [:index, :show] do
      resources :going, only: [:new, :create, :update]
    end

    resources :users, only: [:show] do
      resources :likes, only: [:create]
    end

    resources :quotes, only: [:new, :create, :index, :show, :delete]
    resources :promotors, only: [:new, :create, :delete]

    resources :conversations, only: [:index, :show, :destroy]

    root to: "quotes#new"

end
