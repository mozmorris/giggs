#!/usr/bin/env rake
require 'rake/testtask'

task :default => 'test'

task :app do
  require './app'
end

Dir[File.dirname(__FILE__) + "/lib/tasks/*.rb"].sort.each do |path|
  require path
end

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/*_spec.rb']
end
