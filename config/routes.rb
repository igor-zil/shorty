Rails.application.routes.draw do
  root to: 'links#new'
  get 'links/x/:short', to: 'links#process_short'

  get 'about' => 'pages#about'
  resources :links


end
