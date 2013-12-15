# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schemap/version'

Gem::Specification.new do |spec|
  spec.name          = "schemap"
  spec.version       = Schemap::VERSION
  spec.authors       = ["Nathaniel Wroblewski", "Kenneth Rettberg"]
  spec.email         = ["nathanielwroblewski@gmail.com", "kenrettberg@gmail.com"]
  spec.description   = %q{Visualize your Rails schema}
  spec.summary       = %q{Converts your Rails schema to a D3 force graph}
  spec.homepage      = "https://github.com/NathanielWroblewski/schemap"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.3"
  spec.add_dependency "pry"
  spec.add_dependency "rake"
end
