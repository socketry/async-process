# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.
# Copyright, 2020, by Joe Khoobyar.

require "async/process/version"
require "async/process/child"

require "kernel/sync"

module Async
	module Process
		def self.spawn(*arguments, **options)
			Child.new(*arguments, **options).wait
		end
		
		def self.capture(*arguments, **options)
			input, output = ::IO.pipe
			options[:out] = output
			
			runner = Async do
				spawn(*arguments, **options)
			ensure
				output.close
			end
			
			Sync do
				input.read
			ensure
				runner.wait
				input.close
			end
		end
	end
end
