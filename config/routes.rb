Rails.application.routes.draw do


  get 'members/create'
  post 'groups/join/' => 'members#create'
  get 'groups/new' => 'groups#new'
  get 'groups/create' => 'groups#create'
  post 'groups/create' => 'groups#create'
  get 'groups/index' => 'groups#index'
  delete 'groups/delete/:id' => 'groups#destroy'
  get 'groups/:id' => 'groups#show'
  delete 'members/delete/:id' => 'members#destroy'

  root 'users#new'
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#login'
  get 'users/:id' => 'users#show'
  delete '/logout' => 'users#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
