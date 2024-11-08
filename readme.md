# Async::Process

Implements `Process.spawn` and `Process.capture` for [async](https://github.com/socketry/async).

[![Development Status](https://github.com/socketry/async-process/workflows/Test/badge.svg)](https://github.com/socketry/async-process/actions?workflow=Test)

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'async-process'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install async-process

## Usage

In any asynchronous context (e.g. a reactor), simply use the `Async::Process.spawn` rather than `Process.spawn` like so:

``` ruby
require 'async/process'

Async::Reactor.run do
	status = Async::Process.spawn("ls", "-lah")
end
```

Internally, we use a thread, since `nio4r` doesn't support monitoring pids.

## Contributing

We welcome contributions to this project.

1.  Fork it.
2.  Create your feature branch (`git checkout -b my-new-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin my-new-feature`).
5.  Create new Pull Request.

### Developer Certificate of Origin

In order to protect users of this project, we require all contributors to comply with the [Developer Certificate of Origin](https://developercertificate.org/). This ensures that all contributions are properly licensed and attributed.

### Community Guidelines

This project is best served by a collaborative and respectful environment. Treat each other professionally, respect differing viewpoints, and engage constructively. Harassment, discrimination, or harmful behavior is not tolerated. Communicate clearly, listen actively, and support one another. If any issues arise, please inform the project maintainers.

## See Also

  - [async-container](https://github.com/socketry/async-container) — Execute multiple isolated threads and/or processes.
