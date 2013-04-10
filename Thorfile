$:.unshift File.expand_path("../lib", __FILE__)

require 'sequoia/version'
require 'bundler'
require 'rspec/core/rake_task'
require 'thor/rake_compat'

begin
  require 'mutant'
rescue LoadError
end

class Default < Thor
  include Thor::RakeCompat
  Bundler::GemHelper.install_tasks

  desc 'spec [TYPE]', 'Run RSpec code examples (integration, unit or all)'
  def spec(type=nil)
    exec "rspec --color spec/#{type}"
  end

  desc 'coverage [TYPE]', 'Generate code coverage'
  def coverage(type=nil)
    ENV['COVERAGE'] = 'true'
    spec(type)
  end

  desc 'mutant [NAMESPACE]', 'Run mutation tests for NAMESPACE'
  def mutant(namespace=nil)
    Mutant::CLI.run(%W(-I lib -r sequoia --rspec-dm2 ::Sequoia#{namespace}))
  end

  desc 'build', "Build sequoia-#{Sequoia::VERSION}.gem into the pkg directory"
  def build
    Rake::Task['build'].execute
  end

  desc 'install', "Build and install sequoia-#{Sequoia::VERSION}.gem into system gems"
  def install
    Rake::Task['install'].execute
  end

  desc 'release', "Create tag v#{Sequoia::VERSION} and build and push sequoia-#{Sequoia::VERSION}.gem to Rubygems"
  def release
    Rake::Task['release'].execute
  end
end