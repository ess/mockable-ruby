# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mockable/version'

Gem::Specification.new do |spec|
  spec.name          = "mockable"
  spec.version       = Mockable::VERSION
  spec.authors       = ["Dennis Walters"]
  spec.email         = ["dwalters@engineyard.com"]

  spec.summary       = %q{Declare your intention to mock}
  spec.homepage      = "https://github.com/ess/mockable-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
end
