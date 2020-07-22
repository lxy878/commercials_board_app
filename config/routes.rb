Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :commercials, only: [:index, :show]

  resources :users, only: [:show] do
    resources :commercials, only: [:index, :show, :new, :create, :new, :create, :delete]
  end
  resources :users, only: [:edit, :update]
end
