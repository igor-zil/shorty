Rails.application.routes.draw do
  root to: 'links#index'

  get 'about' => 'pages#about'
  resources :links
end
