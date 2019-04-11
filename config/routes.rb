Rails.application.routes.draw do
  get 'home/index'
  get 'items/index'
  root 'home#index' 
  get 'home/profil'
  post 'home/profil'
  resources :items
  resources :carts
  resources :cart_items
  resources :places do
    resources :comments
  end
  devise_for :users
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
