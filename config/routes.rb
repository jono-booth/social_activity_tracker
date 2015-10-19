Rails.application.routes.draw do
  post 'page/hit', to: 'pages#hit'
  get  'page/score', to: 'pages#score'
  get  'pages/popular', to: 'pages#popular'
end
