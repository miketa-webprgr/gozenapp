Rails.application.routes.draw do
  root 'items#index'

  resources :relationships
  resources :items
end
