Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  delete 'logout' => 'sessions#destroy'
  post 'comments' => 'comments#create'
  delete 'comment/:id' => 'comments#destroy', as: 'delete_comment'
  delete 'commercial/:id' => 'commercials#destroy', as: 'delete_commercial'
  resources :users, only: [:show] do
    resources :commercials, only: [:index, :show, :edit, :new]
  end
  resources :users, only: [:edit, :update]
  resources :commercials, only: [:index, :show, :create, :update]

  get 'mostcommercials' => 'users#most_commercial_user'
end
