Rails.application.routes.draw do
  namespace :users do
    resource :contact
  end

  namespace :accounts do
    get '/:code', to: 'dashboard#show'
  end

  namespace :admin do
    resources :users
    resources :accounts
    resources :contacts
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
