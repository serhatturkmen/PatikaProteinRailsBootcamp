Rails.application.routes.draw do
  resources :posts
  devise_for :users

  get '/user_detail/:id', to: 'welcome#user_page', as: 'welcome_user_page'
  root 'welcome#index'
end
