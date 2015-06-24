lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequoia/version'

Gem::Specification.new do |spec|
  spec.name          = 'sequoia'
  spec.version       = Sequoia::Version::STRING
  spec.authors       = ['Andrey Savchenko']
  spec.email         = ['andrey@aejis.eu']
  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'TODO: Put your gem\'s website or public repo URL here.'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.test_files    = Dir['spec/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
end
