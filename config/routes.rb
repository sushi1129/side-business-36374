Rails.application.routes.draw do
  get 'tops/index'
  devise_for :users
  get 'items/index'
  get 'knowledges/index'
  root to: "tops#index"
  resources :items do
    resources :item_comments, only: :create
  end
  resources :knowledges
end
