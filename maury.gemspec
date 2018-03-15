
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "maury/version"

Gem::Specification.new do |spec|
  spec.name          = "maury"
  spec.version       = Maury::VERSION
  spec.authors       = ["Ess"]
  spec.email         = ["pooster@gmail.com"]

  spec.summary       = %q{An alternative client for the Engine Yard Core API}
  spec.description   = %q{An alternative client for the Engine Yard Core API}
  spec.homepage      = "https://github.com/ess/maury-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dry-validation', '~> 0.11'
  spec.add_dependency 'dry-types', '~> 0.12'
  spec.add_dependency 'dry-struct', '~> 0.4'
  spec.add_dependency 'addressable', '~> 2.5'
  spec.add_dependency 'faraday', '~> 0.14'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock', '~> 3.3'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
