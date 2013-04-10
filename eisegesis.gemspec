# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eisegesis/version'

Gem::Specification.new do |gem|
  gem.name          = "eisegesis"
  gem.version       = Eisegesis::VERSION
  gem.authors       = ["Joe Fredette"]
  gem.email         = ["jfredett@gmail.com"]
  gem.description   = %q{A tool for building projects. It doesn't suck.}
  gem.summary       = %q{A tool for building projects. It doesn't suck.}
  gem.homepage      = ""

  gem.add_dependency 'katuv', '0.0.4'
  gem.add_dependency 'exegesis', '0.0.7'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
