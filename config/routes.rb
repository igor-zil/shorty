Rails.application.routes.draw do
  root to: 'links#new'
  get 'links/x/:short', to: 'links#process_short'
  get 'links/c/:short', to: 'links#process_custom_short'

  get 'about' => 'pages#about'
  resources :links


end
