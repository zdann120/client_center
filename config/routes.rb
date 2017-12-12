Rails.application.routes.draw do
  namespace :accounts do
    get 'documents/show'
  end

  namespace :accounts do
    get 'documents/new'
  end

  namespace :users do
    resource :contact
  end

  resources :accounts, only: [:show], controller: 'accounts/dashboard' do
    resources :receipts, controller: 'accounts/receipts',
      only: [:index, :show]
  end

  namespace :admin do
    resources :users
    resources :accounts
    resources :contacts, except: [:index]
    resources :receipts do
    end
    resources :charges
    resources :documents
    root to: "users#index"
  end

  get 'welcome/index'
  get 'auth/email/:token', to: 'authentication/email#process_token',
    as: 'process_email_token'
  delete '/logout', to: 'authentication/email#logout'
  post 'login/email', to: 'authentication/email#create'
  root 'welcome#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
