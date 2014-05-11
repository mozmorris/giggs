ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'sequel'
require 'database_cleaner'
require 'coveralls'

Coveralls.wear!

require File.expand_path('../../app.rb', __FILE__)

Sequel.extension :migration
Sequel::Migrator.run(GruntSinatra::App.database, 'db/migrations', :use_transactions => true)
DatabaseCleaner.strategy = :truncation
