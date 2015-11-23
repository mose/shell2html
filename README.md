Shell2html
===============

[![Gem Version](https://img.shields.io/gem/v/shell2html.svg)](http://rubygems.org/gems/shell2html)
[![Downloads](http://img.shields.io/gem/dt/shell2html.svg)](https://rubygems.org/gems/shell2html)
[![Build Status](https://img.shields.io/travis/mose/shell2html.svg)](https://travis-ci.org/mose/shell2html)
[![Coverage Status](https://img.shields.io/coveralls/mose/shell2html.svg)](https://coveralls.io/r/mose/shell2html?branch=master)
[![Dependency Status](https://img.shields.io/gemnasium/mose/shell2html.svg)](https://gemnasium.com/mose/shell2html)
[![Code Climate](https://img.shields.io/codeclimate/github/mose/shell2html.svg)](https://codeclimate.com/github/mose/shell2html)

----

A ruby lib for conversion between bash colors and HTML. It was created to help the [Shellplay](https://github.com/mose/shellplay) tool to export html from colored shell output.

Code is still experimental, use at your own risk. But "it works for me". An example of usage is visible on http://mose.com/20140814-dokku/

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

````
require "shell2html"

puts Shell2html.to_html("\e[33m>\e[0m\e[1;31m some colored thing.\e[0m")
````

Commandline command
-------------------

There is a command `shell2html` provided in this lib for commandline execution.

    shell2html <file>
    echo "\e[31mPrompt: \e[0m" | shell2html

The html is output in stdout.

Another command `shell2css` will print out the CSS associated with the generated html.

Use `shell2css sass` to generate a Sass version instead.

Contributing
-----------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Copyright
----------------
(c) Copyright 2014-2015 mose. Distributed under MIT license
