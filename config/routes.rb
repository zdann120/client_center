Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :users do
    resource :contact
  end

  resources :accounts, only: [:show], controller: 'accounts/dashboard' do
    resources :receipts, controller: 'accounts/receipts',
      only: [:index, :show]
    resources :appointments, on: :member, only: :index, controller: 'accounts/appointments'
  end

  namespace :admin do
    resources :users
    resources :accounts
    resources :contacts, except: [:create, :new, :destroy]
    resources :receipts do
    end
    resources :charges
    resources :documents
    root to: "users#index"
  end

  namespace :authentication do
    scope :self_enroll do
      get '/', to: 'self_enrollment#begin'
      get '/c', to: 'self_enrollment#check_registration_key', as: 'check_key'
      get '/set_email', to: 'self_enrollment#select_email'
      post '/process', to: 'self_enrollment#process_registration'
    end
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
