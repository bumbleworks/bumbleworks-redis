# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bumbleworks/redis/version'

Gem::Specification.new do |spec|
  spec.name          = "bumbleworks-redis"
  spec.version       = Bumbleworks::Redis::VERSION
  spec.authors       = ["Ravi Gadad"]
  spec.email         = ["ravi@renewfund.com"]
  spec.description   = %q{Redis support for Bumbleworks process storage}
  spec.summary       = %q{This gem allows you to use a Redis database for your Bumbleworks process storage.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bumbleworks", ">= 0.0.74"
  spec.add_runtime_dependency "ruote-redis"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', "~> 3.0"
  spec.add_development_dependency 'simplecov'
end
