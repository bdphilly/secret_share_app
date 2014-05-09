SecretShareAjax::Application.routes.draw do
  get "friendships/create"
  get "secrets/create"
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, only: [:new, :create]
    resources :friendships, only: [:create, :new]
  end

  resources :secrets, only: [:create, :new]

  resources :friendships, only: [:destroy]

  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"
end
