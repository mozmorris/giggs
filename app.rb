require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

require 'dotenv'
Dotenv.load

# Require base
require 'sinatra/base'
require 'active_support/core_ext/string'
require 'active_support/core_ext/array'
require 'active_support/core_ext/hash'
require 'active_support/json'

libraries = Dir[File.expand_path('../lib/**/*.rb', __FILE__)]
libraries.each do |path_name|
  require path_name
end

require 'app/models'
require 'app/helpers'
require 'app/routes'

module GruntSinatra
  class App < Sinatra::Application
    configure do
      set :database, lambda {
        ENV['DATABASE_URL'] ||
          "mysql2://username:password@localhost:3306/sinatra_create_#{environment}"
      }
    end

    configure :development, :staging do
      database.loggers << Logger.new(STDOUT)
    end

    configure do
      disable :method_override
      disable :static

      set :erb, escape_html: true

      set :sessions,
          httponly: true,
          secure: production?,
          secure: false,
          expire_after: 5.years,
          secret: ENV['SESSION_SECRET']
    end

    use Rack::Deflater
    use Rack::Standards

    use Routes::Static

    unless settings.production?
      # Production only
    end

    # Other routes:
    use Routes::Pages
  end
end

# Model access from console
include GruntSinatra::Models
