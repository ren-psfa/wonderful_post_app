Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
  }

  resources :articles
  resources :mypage
  # トップページの実装
  root 'articles#index'
  # マイページのルーティング
  get '/mypage', to: 'mypage#index'
  # 検索のルーティング
  # get '/_search', to: 'articles#search'
end
