Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'page/hit', to: 'pages#hit'
  get  'page/score', to: 'pages#score'
  get  'pages/popular', to: 'pages#popular'
end
