# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails'#, '~> 4.2'
gem 'jbuilder'#, #'~> 2.5'
gem 'puma'#, '~> 3.7'
gem 'rails', '~> 5.2'
gem 'sass-rails'#, '~> 5.0'
gem 'turbolinks'#, '~> 5'
gem 'uglifier'#, '>= 1.3.0'
gem 'pg'
gem 'base62-rb'
gem 'clipboard-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'#, '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen'#, '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen'#, '~> 2.0.0'
  gem 'web-console'#, '>= 3.3.0'
end

gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'high_voltage'
gem 'jquery-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'binding_of_caller'

group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :test do
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'launchy'
end
