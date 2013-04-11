# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequoia/version'

Gem::Specification.new do |spec|
  spec.name          = 'sequoia'
  spec.version       = Sequoia::VERSION
  spec.authors       = ['Andrey Savchenko', 'Dima Lunich']
  spec.email         = ['andrey@aejis.eu', 'dima.lunich@gmail.com']
  spec.summary       = %q{Gem for building data structures}
  spec.description   = %q{Sequoia is a gem for building environment-aware structures like configs, translations etc.}
  spec.homepage      = 'https://github.com/Ptico/sequoia'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
