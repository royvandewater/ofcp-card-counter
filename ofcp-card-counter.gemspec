# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ofcp-card-counter/version'

Gem::Specification.new do |spec|
  spec.name          = "ofcp-card-counter"
  spec.version       = OfcpCardCounter::VERSION
  spec.authors       = ["Roy van de Water"]
  spec.email         = ["me@royvandewater.com"]
  spec.description   = %q{Open Face Chinese Poker Statistics}
  spec.summary       = %q{Statistics calculations for Open Face Chinese Poker hands}
  spec.homepage      = "http://github.com/royvandewater/ofcp-card-counter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
