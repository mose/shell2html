Shell2html
===============

A ruby lib for conversion between bash colors and HTML.

Code is still experimental, use at your own risk.

Installation
-------------------
Add this line to your application's Gemfile:

    gem 'shell2html'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shell2html

Usage
-----------------

Commandline command
-------------------
There is a command `shell2html` provided in this lib for commandline execution.

    shell2html <file>
    echo "\e[31mPrompt: \e[0m" | shell2html

The html is output in stdout.

Contributing
-----------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Copyright
----------------
(c) Copyright 2014 mose. Distributed under MIT license
