# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'bootsnap', '~> 1.16.0'
gem 'burnish_rails',
    git: 'https://github.com/ChristineP2/burnish_rails',
    ref: 'b6dc2cc'
gem 'pg', '~> 1.4.5'
gem 'puma', '~> 6.0.2'
gem 'rails', '~> 7.0.4'
gem 'simple_form', '~> 5.2.0'
gem 'simple-navigation', '~> 4.4.0'
gem 'validates_zipcode', '~> 0.5.2'
gem 'vite_rails', '~> 3.0.13'
gem 'zip-codes'

group :development do
  gem 'amazing_print'
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'erb_lint', require: false
  gem 'letter_opener'
  gem 'overcommit'
  gem 'rubocop'
  gem 'rubocop-ast'
  gem 'rubocop-github'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'syntax_suggest'
  gem 'web-console'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'js_from_routes'
  gem 'launchy'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :test do
  gem 'capybara-lockstep'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
