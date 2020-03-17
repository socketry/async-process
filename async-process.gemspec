# coding: utf-8
require_relative "lib/async/process/version"

Gem::Specification.new do |spec|
	spec.name          = "async-process"
	spec.version       = Async::Process::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]

	spec.summary       = "Asynchronous process spawning."
	spec.homepage      = "https://github.com/socketry/async-process"

	spec.files         = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end
	
	spec.require_paths = ["lib"]

	spec.add_dependency "async", "~> 1.0"
	spec.add_dependency "async-io", "~> 1.0"
	spec.add_development_dependency "async-rspec", "~> 1.1"

	spec.add_development_dependency "covered"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rspec", "~> 3.0"
end
