# Copyright, 2018, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'async/io/generic'

module Async
	module Process
		class Child
			def initialize(*args, **options)
				# Setup a cross-thread notification pipe - nio4r can't monitor pids unfortunately:
				pipe = ::IO.pipe
				@input = Async::IO::Generic.new(pipe.first)
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
