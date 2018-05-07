Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'  
  get 'welcome/logmein'
  
  resources :posts
  
  root 'welcome#index'
  
  get 'tags/:tag', to: 'posts#index', as: :tag
  
end
