# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picolib/version'

Gem::Specification.new do |spec|
  spec.name          = "picolib"
  spec.version       = Picolib::VERSION
  spec.authors       = ["elvis"]
  spec.email         = ["elvis@u3dspace.com"]
  spec.summary       = %q{"A lightweight, flexible library for Picowork with support for the Account Api and Contact"}
  spec.description   = %q{"Picolib is a Ruby SDK for Picowork. It provides a few public common APIs to use. We wish you can develop creative Apps on Picowork. Jsut enjoy it."}
  spec.homepage      = "https://github.com/elvisshih/picolib"

  # spec.files         = `git ls-files -z`.split("\x0")
  # spec.files         = Dir["{lib}/**/*"]
  spec.files         = ["lib/picolib.rb", "lib/picolib/version.rb", "lib/picolib/account_api.rb", "lib/picolib/contact_api.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty", "~> 0.13.7"
  spec.licenses = ["MIT"]
end
