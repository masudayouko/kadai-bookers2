Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#home'
  get "home/about" => "homes#about"
  root'books#new'
  resources :books
  resources :users
  # Forr details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
