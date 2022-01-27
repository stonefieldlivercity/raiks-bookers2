Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/top' => 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :users, only: [:new, :index,:show,:edit,:create,:update]

  resources :books, only: [:new, :create, :index,:show,:edit,:update, :destroy]
end
