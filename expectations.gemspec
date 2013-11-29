# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'expectations/version'

Gem::Specification.new do |spec|
  spec.name          = "expectations"
  spec.version       = Expectations::VERSION
  spec.authors       = ["Prathamesh Sonpatki"]
  spec.email         = ["csonpatki@gmail.com"]
  spec.description   = %q{Write expectations about your input.}
  spec.summary       = %q{Expect something from input. If it is not met raise error, return error message or do whatever.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
