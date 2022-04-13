Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spots, only: [ :index, :show ]

  # resources :likes, only: [ :update ]
  resources :reviews, only: [:create, :new, :index, :destroy]
  get 'matches', to: 'spots#matches'
  get 'profile', to: 'pages#profile'

end
