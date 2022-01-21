Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/top' => 'homes#top'
  get 'homes/about'
  devise_for :users

  resources :users

  resources :books
end
