Rails.application.routes.draw do
  resources :sumple_articles
  resources :articles
  # トップページの実装
  root 'articles#index'
  # root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
