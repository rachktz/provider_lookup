Rails.application.routes.draw do
  
  get 'pages/home'

  get 'pages/about'

  root 'application#hello'
  
end
