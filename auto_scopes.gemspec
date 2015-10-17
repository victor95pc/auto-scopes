# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_scopes/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_scopes"
  spec.version       = AutoScopes::VERSION
  spec.authors       = ["victor95pc"]
  spec.email         = ["victorpalomocastro@gmail.com"]

  spec.summary       = %q{Recycle already defined scopes on multiple models whatever the association are, making your models way more DRYer}
  spec.description   = %q{I always wonder if it was possible to reuse some scopes defined in a deep associations, we all know that is possible using merges but it still not a clean solution, I still need to define new scopes and make joins so Rails can know which model I want, so I started to develop this gem, the idea is easy to follow, put all scopes you want inside a YAML file.}
  spec.homepage      = "https://github.com/victor95pc/auto-scopes"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"
  spec.add_dependency "rails", ">= 3.2.0"
  spec.add_dependency "configurations", '~> 2.2.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "generator_spec"
end
