$:.unshift File.expand_path('../lib', __FILE__)

require 'sequoia/version'

class Default < Thor
  desc 'test [TYPE]', 'Run RSpec code examples (integration, unit or all)'
  def test(type=nil)
    exec "rspec spec/#{type}"
  end

  desc 'coverage [TYPE]', 'Generate code coverage'
  def coverage(type=nil)
    ENV['COVERAGE'] = 'true'
    spec(type)
  end

  desc 'build', "Build sequoia-#{Sequoia::Version::STRING}.gem into the pkg directory"
  def build
    Bundler::GemHelper.new.build_gem
  end

  desc 'install', "Build and install sequoia-#{Sequoia::Version::STRING}.gem into system gems"
  def install
    helper = Bundler::GemHelper.new
    helper.install_gem(helper.build_gem)
  end

  desc 'release', "Create tag v#{Sequoia::Version::STRING} and build and push sequoia-#{Sequoia::Version::STRING}.gem to Rubygems"
  def release
    helper = Bundler::GemHelper.new
    helper.release_gem(helper.build_gem)
  end
end
