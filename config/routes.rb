Rails.application.routes.draw do
  devise_for :users
  #Posts
  get 'posts/new'
  get 'posts/view/:id', to: 'posts#view', as: 'posts_view'
  get 'posts/edit/:id', to: 'posts#edit', as: 'posts_edit'
  get 'posts/destroy/:id', to: 'posts#destroy', as: 'posts_destroy'
  get 'posts/myPosts/:id', to: 'posts#findMyPosts', as: 'posts_my_posts'

  post 'posts/create'
  post 'posts/update', to: 'posts#update', as: 'posts_update'
  post 'post/find', to: 'posts#find'
  #Pages
  get 'pages/contact'
  #Root
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
