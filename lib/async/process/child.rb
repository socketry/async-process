# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.

module Async
	module Process
		class Child
			def initialize(*args, **options)
				# Setup a cross-thread notification pipe - nio4r can't monitor pids unfortunately:
				pipe = ::IO.pipe
				@input = pipe.first
				@output = pipe.last
				
				@exit_status = nil
				
				@pid = ::Process.spawn(*args, **options, pgroup: true)
				
				@thread = Thread.new do
					_, @exit_status = ::Process.wait2(@pid)
					@output.close
				end
			end
			
			attr :pid
			
			def running?
				@exit_status.nil?
			end
			
			def kill(signal = :TERM)
				::Process.kill(signal, -@pid)
			end
			
			def wait
				if @exit_status.nil?
					wait_thread
				end
				
				return @exit_status
			end
			
			private
			
			def wait_thread
				@input.read(1)
				
			ensure
				# If the user stops this task, we kill the process:
				if @exit_status.nil?
					::Process.kill(:KILL, -@pid)
				end
				
				@thread.join
				
				# We are done with the notification pipe:
				@input.close
				@output.close
			end
		end
	end
end
