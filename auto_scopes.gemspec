# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_scopes/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_scopes"
  spec.version       = AutoScopes::VERSION
  spec.authors       = ["victor95pc"]
  spec.email         = ["victorpalomocastro@gmail.com"]

  spec.summary       = %q{Recycle all your defined scopes for others models}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/victor95pc/auto-scopes"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"
  spec.add_dependency "activerecord", ">= 3.2.0"
  spec.add_dependency "railties"
  spec.add_dependency "configurations", '~> 2.2.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "sqlite3"
end
