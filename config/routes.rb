Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :users do
    resource :contact
  end

  resources :accounts, only: [:show], controller: 'accounts/dashboard' do
    get '/invite', on: :member, to: 'accounts/dashboard#registration_invite'
    resources :receipts, controller: 'accounts/receipts',
      only: [:index, :show]
    resources :appointments, on: :member, only: :index, controller: 'accounts/appointments'
    resources :inbound_emails, only: [:index, :show], controller: 'accounts/inbound_emails' do
      get '/html', on: :member, to: 'accounts/inbound_emails#show_html'
    end
  end

  resources :versions, only: :show

  namespace :endpoints do
    post 'incoming_email', to: 'incoming_email#execute'
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
      post '/ajax', to: 'self_enrollment#ajax_enroll'
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
