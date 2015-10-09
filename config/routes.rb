Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :taggings
  root 'articles#index'
end
