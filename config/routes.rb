Rails.application.routes.draw do
  
  get 'solveds/create'
  get 'solveds/destroy'
  root to: 'toppages#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :edit, :update] 
  
  resources :wanteds, only: [:show, :new, :create, :update, :destroy] do
    resources :testimonies, only: [:create, :destroy]
  end
  
  resources :rooms, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :cooperations, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
