# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.3"

gem 'rails', '~> 8.0', '>= 8.0.1'

gem 'bundler', '~> 2.5', '>= 2.5.18'

gem 'dotenv', '~> 3.1', '>= 3.1.7'

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '6.0.0.rc.6'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.13'

# AUTHENTICATION
gem 'devise', '~> 4.9', '>= 4.9.4'

# LOCALIZATION
gem 'rails-i18n', '~> 8.0', '>= 8.0.1'

# UI
gem 'jquery-rails', '~> 4.6'
gem 'bootstrap', '~> 5.3', '>= 5.3.3'
gem 'octicons_helper', '~> 19.14'

# API gists
gem 'octokit', '~> 9.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.18.4', require: false
gem 'dotenv-rails', '~> 3.1', '>= 3.1.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '~> 4.2', '>= 4.2.1'

  gem 'listen', '~> 3.9'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem 'rack-mini-profiler', '~> 3.3', '>= 3.3.1'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring', '~> 4.2', '>= 4.2.1'

  # For devise confirmable email
  gem 'letter_opener', '~> 1.10'

  gem 'rubocop', '~> 1.71'
  gem 'rubocop-performance', '~> 1.23', '>= 1.23.1'
  gem 'rubocop-rails', '~> 2.29', '>= 2.29.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '~> 3.40'
  gem 'selenium-webdriver', '>= 4.0', '< 4.11'
  gem 'webdrivers', '~> 5.3', '>= 5.3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
