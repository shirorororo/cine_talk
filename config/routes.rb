Rails.application.routes.draw do
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
  get "/users/favorites/:id" => "users#favorites"
  
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
  
  resources :watch_lists, only:[:create, :new, :edit, :update, :destroy]
  
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
