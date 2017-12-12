web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec rails jobs:work
redis: bundle exec redis server
sidekiq: bundle exec sidekiq
