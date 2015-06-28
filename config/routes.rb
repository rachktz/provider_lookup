Rails.application.routes.draw do
  
  get 'claims/index'

  root 'pages#home'

  get 'about' => "pages#about"

  get 'claims' => "pages#claims"
  
end
