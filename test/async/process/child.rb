# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.

require "async/process"
require "sus/fixtures/async"

describe Async::Process::Child do
	include Sus::Fixtures::Async::ReactorContext
	
	it "will terminate sub-process when stopping task" do
		child = nil
		
		task = reactor.async do
			child = subject.new("sleep 60")
			
			child.wait
		end
		
		expect(child).to be(:running?)
		
		task.stop
		task.wait
		
		expect(child).not.to be(:running?)
	end
	
	with "#kill" do
		it "can kill child process" do
			child = subject.new("sleep 60")
			
			expect(child).to be(:running?)
			
			child.kill
			
			status = child.wait
			
			expect(child).not.to be(:running?)
			
			expect(status).to be_a(Process::Status)
			expect(status).not.to be(:success?)
		end
	end
end
