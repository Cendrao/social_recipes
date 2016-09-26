Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :recipes, only: [:index, :show, :new, :create]
  resources :kitchens, only: [:show, :new, :create]
end
