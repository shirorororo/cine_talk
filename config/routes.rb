Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  }

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  resources :users, :only => [:index, :show, :profile]
  get "/profile/:id" => "users#profile"
  get "/reviewindex/:id" => "users#reviewindex"
  get "/watchlists/:id" => "users#watchlists"
  get "/home" => "users#home"
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  
  resources :reviews do
    collection do
      post :confirm
    end
  end
  resources :words do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :watch_lists
  
  resources :favorites, only: [:create, :destroy]
  get "/users/favorites/:id" => "users#favorites"
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
