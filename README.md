# Async::Process

Implements `Process.spawn` and `Process.capture` for [async].

[![Build Status](https://travis-ci.com/socketry/async-process.svg?branch=master)](https://travis-ci.com/socketry/async-process)
[![Code Climate](https://codeclimate.com/github/socketry/async-process.svg)](https://codeclimate.com/github/socketry/async-process)
[![Coverage Status](https://coveralls.io/repos/socketry/async-process/badge.svg)](https://coveralls.io/r/socketry/async-process)

[async]: https://github.com/socketry/async

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'async-process'
```

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install async-process

## Usage

In any asynchronous context (e.g. a reactor), simply use the `Async::Process.spawn` rather than `Process.spawn` like so:

```ruby
require 'async/process'

Async::Reactor.run do
	status = Async::Process.spawn("ls", "-lah")
end
```

Internally, we use a thread, since `nio4r` doesn't support monitoring pids.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## See Also

- [async-container](https://github.com/socketry/async-container) — Execute multiple isolated threads and/or processes.

## License

Released under the MIT license.

Copyright, 2017, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
