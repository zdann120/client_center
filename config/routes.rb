Rails.application.routes.draw do
  get 'welcome/index'
  get 'auth/email/:token', to: 'authentication/email#process_token',
    as: 'process_email_token'
  post 'login/email', to: 'authentication/email#create'
  root 'welcome#index'
end
