Rails.application.routes.draw do
  root to: 'homes#home'
  get "home/about" => "homes#about"
  root'post_images#index'
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
