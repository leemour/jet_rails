#source 'http://rubygems.org'
#
#gem 'rails', '3.1.0'
#
## Bundle edge Rails instead:
## gem 'rails',     :git => 'git://github.com/rails/rails.git'
#
## for Heroku deployment - as described in Ap. A of ELLS book
#group :development, :test do
#  gem 'sqlite3'
#  #gem 'ruby-debug19', :require => 'ruby-debug'
#  gem 'database_cleaner'
#  gem 'launchy'
#  #gem 'newrelic_rpm'
#  gem 'railroady'
#end
#group :production do
#  gem 'pg'
#end
#
#group :test do
#  gem 'rspec-rails'
#  gem 'spork-rails'
#  gem 'simplecov'
#  gem 'capybara'
#  gem 'cucumber-rails', :require => false
#  gem 'cucumber-rails-training-wheels'
#  gem 'factory_girl'
#end
## Gems used only for assets and not required
## in production environments by default.
#group :assets do
#  gem 'therubyracer'
#  gem 'sass-rails', "  ~> 3.1.0"
#  gem 'coffee-rails', "~> 3.1.0"
#  gem 'uglifier'
#end
#
#gem 'jquery-rails'
#
## Use unicorn as the web server
## gem 'unicorn'
#
## Deploy with Capistrano
## gem 'capistrano'
#
## To use debugger
#gem 'haml-rails'


var = [1,5,3,4,5,67,8,44]
var.each do |item|
  print item.to_s + "\n"
  print item.save!
end
