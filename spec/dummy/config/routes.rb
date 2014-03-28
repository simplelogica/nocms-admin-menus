Rails.application.routes.draw do
  mount NoCms::Admin::Engine => "/admin"
  mount NoCms::Admin::Menus::Engine => "/admin"

  resources :products

  resources :pages, only: [:index]
  get '*path', to: 'pages#show'
end
