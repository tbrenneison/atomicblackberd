Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'  
  get 'welcome/logmein'
  
  resources :posts
  
  root 'welcome#index'
end
