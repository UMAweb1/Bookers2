Rails.application.routes.draw do
  get 'home/about'
  root :to => 'users#home'
  devise_for :users
  resources :books do
  	resources :favorites, only: [:create, :destroy, :index]
  	resources :post_comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
