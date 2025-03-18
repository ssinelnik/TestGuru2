source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.0.0"
ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem "rails", "~> 7.1.4", ">= 7.1.3.4"
# gem 'rails', '~> 8.0', '>= 8.0.1'
gem 'rails', '~> 7.1', '>= 7.1.4'

gem 'bundler', '~> 2.6', '>= 2.6.5'

gem 'autoprefixer-rails', '~> 10.4', '>= 10.4.19.0'

gem 'npm-rails', '~> 0.2.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
# gem "pg", "~> 1.1"
gem 'pg', '~> 1.5', '>= 1.5.9'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# gem 'puma', '~> 6.6'

# Use SCSS for stylesheets
# gem 'sass-rails'
gem 'sass-rails', '~> 6.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

gem 'font-awesome-sass'
# gem 'font-awesome-sass', '~> 6.7', '>= 6.7.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# gem 'uglifier', '~> 4.2', '>= 4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# gem 'mini_racer', '~> 0.16.0', platforms: :ruby
# gem 'mini_racer', '0.18.0.pre1', platforms: :ruby

# gem 'libv8-node', '~> 23.6', '>= 23.6.1.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# gem 'turbolinks', '~> 5.2', '>= 5.2.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# gem 'jbuilder', '~> 2.13'


# AUTHENTICATION
# gem 'devise', '~> 4.0'
# gem 'devise', '~> 4.9', '>= 4.9.4'
# gem 'devise', '~>4.8'
# gem 'devise', '~> 4.0'
gem "devise", "~> 4.9"

# LOCALIZATION
gem 'rails-i18n', '~> 7.0.0'
# gem 'rails-i18n', '~> 8.0', '>= 8.0.1'

# INITIALIZATION
gem 'i18n', '~> 1.14', '>= 1.14.7'

# UI
gem 'jquery-rails'
gem 'bootstrap', '~> 5.3.3'
gem 'octicons_helper'
# gem 'jquery-rails', '~> 4.6'
# gem 'bootstrap', '~> 5.3', '>= 5.3.3'
# gem 'octicons_helper', '~> 19.14'

# API gists
gem 'octokit', '~> 9.2'

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# gem 'bootsnap', '>= 1.18.4', require: false
gem 'dotenv-rails', '~> 3.1', '>= 3.1.7'

gem 'dotenv', groups: [:development, :test]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # gem 'rubocop'
  # gem 'rubocop-performance'
  # gem 'rubocop-rails'

  # gem 'dotenv-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "web-console"
  gem 'web-console', '~> 4.2', '>= 4.2.1'

  # gem 'listen', '~> 3.3'
  gem 'listen', '~> 3.9'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  gem 'rack-mini-profiler', '~> 3.3', '>= 3.3.1'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'spring', '~> 4.2', '>= 4.2.1'

  gem 'spring-watcher-listen', '~> 2.1'

  # For devise confirmable email
  # gem 'letter_opener'
  gem 'letter_opener', '~> 1.10'

  # gem 'rubocop', '~> 1.71'
  gem 'rubocop', '~> 1.71', '>= 1.71.2'
  gem 'rubocop-performance', '~> 1.23', '>= 1.23.1'
  gem 'rubocop-rails', '~> 2.29', '>= 2.29.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  # gem "capybara"
  gem 'capybara', '~> 3.40'

  # gem "selenium-webdriver"
  gem 'selenium-webdriver', '>= 4.0', '< 4.11'

  gem 'webdrivers', '~> 5.3', '>= 5.3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
