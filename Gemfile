# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.4'

gem 'coffee-rails'#, '~> 4.2'
gem 'jbuilder'#, #'~> 2.5'
gem 'puma'#, '~> 3.7'
gem 'rails'#, '~> 5.1.1'
gem 'sass-rails'#, '~> 5.0'
gem 'sqlite3'
gem 'turbolinks'#, '~> 5'
gem 'uglifier'#, '>= 1.3.0'

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

group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
