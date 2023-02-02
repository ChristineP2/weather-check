source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bcrypt"
gem "bootsnap"
gem 'devise'
gem "pg"
gem "puma"
gem "sidekiq"
gem "simple_form"
gem "simple-navigation"
gem "rails", "~> 7.0.4"
gem "vite_rails"

group :development do
  gem "amazing_print"
  gem "annotate"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "burnish_rails", git: 'https://github.com/ChristineP2/burnish_rails'
  gem "erb_lint", require: false
  gem "letter_opener"
  gem "rubocop"
  gem "rubocop-ast"
  gem "rubocop-github"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "web-console"
  gem "syntax_suggest"
end

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "js_from_routes"
  gem "launchy"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec_junit_formatter"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

group :test do
  gem "cucumber-rails", require: false
  gem 'capybara-lockstep'
  gem "database_cleaner-active_record"
  gem "database_cleaner-redis"
  gem "selenium-webdriver"
  gem "webdrivers"
end
