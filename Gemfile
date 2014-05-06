source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', github: 'maccman/sinatra-contrib'
gem 'sinatra-flash'
gem 'rack-standards'
gem 'erubis'
gem 'i18n'
gem 'activesupport'
gem 'rake'
gem 'builder'
gem 'json', '~> 1.7.7'
gem 'dotenv'
gem 'bcrypt-ruby'

# DB
gem 'sequel'
gem 'sinatra-sequel'
gem 'mysql2'

group :production do
  gem 'passenger'
end

group :development do
  gem 'debugger', require: 'ruby-debug'
  gem 'thor'
end

group :test do
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'coveralls', require: false
end
