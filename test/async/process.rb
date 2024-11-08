# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "async/process"
require "sus/fixtures/async"

describe Async::Process do
	include Sus::Fixtures::Async::ReactorContext
	
	it "should execute sub-process" do
		status = subject.spawn("ls", "-lah")
		
		expect(status).to be(:success?)
	end
	
	it "can capture output" do
		output = subject.capture("ls", "-lah")
		
		expect(output).to be(:include?, "async-process")
	end
end
