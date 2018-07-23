Rails.application.routes.draw do
  root to: 'links#new'

  get 'about' => 'pages#about'
  resources :links
end
