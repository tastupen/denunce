Rails.application.routes.draw do
  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'mypage/:id/edit', to: 'sessions#edit', as: 'edit_mypage'
  get 'mypage/:id', to: 'sessions#show', as: 'mypage'
  patch 'mypage/:id', to: 'sessions#update' 
  put 'mypage/:id', to: 'sessions#update'
  
  #likes
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  
  #admin
  namespace :admin do
    resources :users
  end
  
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
