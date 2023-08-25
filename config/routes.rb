Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :locations
end
