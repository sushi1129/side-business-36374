Rails.application.routes.draw do
  get 'tops/index'
  devise_for :users
  get 'items/index'
  get 'knowledges/index'
  root to: "tops#index"
  resources :items, only: [:index, :new, :create]
  resources :knowledges, only: [:index, :new, :create]
end
