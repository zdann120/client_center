Rails.application.routes.draw do
  namespace :accounts do
    get '/:code', to: 'dashboard#show'
  end

  namespace :admin do
    resources :users
    resources :accounts

    root to: "users#index"
  end

  get 'welcome/index'
  get 'auth/email/:token', to: 'authentication/email#process_token',
    as: 'process_email_token'
  post 'login/email', to: 'authentication/email#create'
  root 'welcome#index'
end
