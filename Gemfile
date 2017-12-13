source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.2"

gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "5.1.4"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"


group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.6"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :production do
  gem "rack-timeout"
end

gem 'high_voltage'
gem 'bourbon', '~> 5.0.0.beta.8'
gem 'neat', '~> 2.1'
gem 'refills', group: [:development, :test]

gem "slim-rails"
# gem "clearance"
gem "sorcery"
gem "bootstrap"
gem "active_interaction"
gem "ulid"
gem "pundit"
gem "country_select"
gem "sidekiq"
gem "redis"
gem "money-rails"
gem 'carrierwave', '~> 1.0'
gem "fog-aws"
gem "activeadmin", github: 'activeadmin/activeadmin'
gem "haikunator"
gem "simple_calendar", "~> 2.0"
gem "active_link_to"
gem "paper_trail", "~> 8.1.1"
