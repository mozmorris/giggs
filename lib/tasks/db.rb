namespace :db do
  desc 'Run DB migrations'
  task :migrate => :app do
   require 'sequel/extensions/migration'

   Sequel::Migrator.apply(GruntSinatra::App.database, 'db/migrations')
  end

  desc 'Rollback migration'
  task :rollback => :app do
    require 'sequel/extensions/migration'
    database = GruntSinatra::App.database

    version  = (row = database[:schema_info].first) ? row[:version] : nil
    Sequel::Migrator.apply(database, 'db/migrations', version - 1)
  end

  desc 'Seed database'
  task :seed => :app do
    seed_file = 'db/seed.rb'
    load(seed_file) if File.exist?(seed_file)
  end
end

