# frozen_string_literal: true

require_relative "lib/async/process/version"

Gem::Specification.new do |spec|
	spec.name = "async-process"
	spec.version = Async::Process::VERSION
	
	spec.summary = "Asynchronous process spawning."
	spec.authors = ["Samuel Williams", "Joe Khoobyar"]
	spec.license = "MIT"
	
	spec.cert_chain  = ["release.cert"]
	spec.signing_key = File.expand_path("~/.gem/release.pem")
	
	spec.homepage = "https://github.com/socketry/async-process"
	
	spec.metadata = {
		"source_code_uri" => "https://github.com/socketry/async-process.git",
	}
	
	spec.files = Dir.glob(["{lib}/**/*", "*.md"], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
	
	spec.add_dependency "async", "~> 2.0"
end
