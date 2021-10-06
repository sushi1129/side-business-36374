Rails.application.routes.draw do
  get 'tops/index'
  devise_for :users
  get 'items/index'
  get 'knowledges/index'
  root to: "tops#index"
  get 'users/index'

  resources :users, only: [:show, :edit, :update, :destroy]
  
  resources :items do
    resources :item_comments, only: [:create, :destroy]
  end

  resources :knowledges do
    resources :knowledge_comments, only: [:create, :destroy]
    resources :knowledge_goods, only: [:create, :destroy]
    resources :knowledge_bads, only: [:create, :destroy]
  end
end
