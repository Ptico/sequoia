require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'reek/rake/task'

desc 'Test configga'
RSpec::Core::RakeTask.new('spec')

namespace :metrics do
  desc 'Generate code coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].execute
  end

  Reek::Rake::Task.new do |reek|
    reek.reek_opts = '--quiet'
  end
end