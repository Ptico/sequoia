require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'reek/rake/task'

begin
  require 'mutant'
rescue LoadError
end

task :default => :spec

desc 'Test sequoia'
RSpec::Core::RakeTask.new('spec')

desc 'Generate code coverage'
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['spec'].execute
end

desc 'Run mutation tests'
task :mutant, :namespace do |t, args|
  args.with_defaults(namespace: '::Sequoia')
  Mutant::CLI.run(%W(-I lib -r sequoia --rspec-dm2 #{args[:namespace]}))
end