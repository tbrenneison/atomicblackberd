Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'  
  get 'welcome/logmein'
  get 'welcome/about'
  get 'welcome/contact'
  
  resources :posts
  resources :listings
  
  root 'welcome#index'
  
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'listingtags/:tag', to: 'listings#index', as: :listingtag
  
end
