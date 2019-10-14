Rails.application.routes.draw do
  get 'home/about'
  root :to => 'users#home'
  devise_for :users
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
