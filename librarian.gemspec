# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "librarian/version"

Gem::Specification.new do |gem|
  gem.name          = "librarian"
  gem.version       = Librarian::VERSION
  gem.authors       = ["Jay Feldblum"]
  gem.email         = ["y_feldblum@yahoo.com"]
  gem.summary       = %q{Librarian}
  gem.description   = %q{Librarian}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "thor", "~> 0.15"
  gem.add_dependency "highline"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "json"
  gem.add_development_dependency "fakefs", "~> 0.4.2"
end
