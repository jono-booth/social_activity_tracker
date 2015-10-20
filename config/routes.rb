Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'page/stat', to: 'pages#stat'
  get  'page/score', to: 'pages#score'
  get  'pages/popular', to: 'pages#popular'
end
