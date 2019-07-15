Rails.application.routes.draw do
  #Posts
  get 'posts/new'
  get 'posts/view'
  get 'posts/edit'

  post 'posts/create'
  #Pages
  get 'pages/index'
  get 'pages/contact'
  #Root
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
