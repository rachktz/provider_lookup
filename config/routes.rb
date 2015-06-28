Rails.application.routes.draw do
  
  root 'pages#home'

  get 'about' => "pages#about"

  get 'claims' => "pages#claims"

  get 'index' => 'claims#index'
  
end
