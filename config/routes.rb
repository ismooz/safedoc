Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'faq', to: 'pages#faq'
  get 'gdpr', to: 'pages#gdpr'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :folders, only: [:index, :show]
  resources :documents, only: [:show, :new, :create]

end
