# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequoia/version'

Gem::Specification.new do |spec|
  spec.name          = 'sequoia'
  spec.version       = Sequoia::VERSION
  spec.authors       = ['Andrey Savchenko']
  spec.email         = ['andrey@aejis.eu']
  spec.summary       = %q{Yet another configuration management gem}
  spec.description   = %q{Super-duper fast, environment-aware and dead-simple configuration manager}
  spec.homepage      = 'https://github.com/Ptico/sequoia'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'simplecov'
end
