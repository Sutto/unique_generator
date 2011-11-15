require "bundler/gem_tasks"

require 'rspec/core/rake_task'
begin
  require 'ci/reporter/rake/rspec'
rescue LoadError => e
end

RSpec::Core::RakeTask.new do |task|
  task.name = :spec
end

task :default => :spec
