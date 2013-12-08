# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sha_cache/version'

Gem::Specification.new do |spec|
  spec.name          = "sha_cache"
  spec.version       = ShaCache::VERSION
  spec.authors       = ["Janis Miezitis"]
  spec.email         = ["janjiss@gmail.com"]
  spec.description   = %q{With sha_cache gem you can cache sha's of API responeses. In that way you can skip updating heavy data processing if you need to}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
