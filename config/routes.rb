Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#home'

  get 'search', to: 'products#search'

  resources :products do
    resources :reviews
  end

  get 'delete', to: 'reviews#destroy', as:
  :review_destroy
end
