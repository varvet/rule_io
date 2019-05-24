# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rule_io/version"

Gem::Specification.new do |spec|
  spec.name          = "rule_io"
  spec.version       = RuleIo::VERSION
  spec.authors       = ["Linus Pettersson"]
  spec.email         = ["linus@varvet.com"]
  spec.summary       = "Ruby API wrapper for Rule.io"
  spec.description   = "Ruby API wrapper for Rule.io"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus", ">= 1.0.3"
  spec.add_dependency "faraday", ">= 0.9.0"
  spec.add_dependency "faraday_middleware", ">= 0.9.1"

  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "webmock", "1.20.4"
end
