
require_relative "lib/async/process/version"

Gem::Specification.new do |spec|
	spec.name = "async-process"
	spec.version = Async::Process::VERSION
	
	spec.summary = "Asynchronous process spawning."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.homepage = "https://github.com/socketry/async-process"
	
	spec.files = Dir.glob('{lib}/**/*', File::FNM_DOTMATCH, base: __dir__)
	
	spec.add_dependency "async", "~> 1.0"
	spec.add_dependency "async-io", "~> 1.0"
	
	spec.add_development_dependency "async-rspec", "~> 1.1"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "covered"
	spec.add_development_dependency "rake", "~> 11.0"
	spec.add_development_dependency "rspec", "~> 3.0"
end
