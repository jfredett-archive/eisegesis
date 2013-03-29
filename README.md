# Eisegesis [![Gem Version](https://badge.fury.io/rb/eisegesis.png)](http://badge.fury.io/rb/eisegesis) [![Build Status](https://travis-ci.org/jfredett/eisegesis.png?branch=master)](http://travis-ci.org/jfredett/eisegesis) [![Code Climate](https://codeclimate.com/github/jfredett/eisegesis.png)](https://codeclimate.com/github/jfredett/eisegesis) [![Coverage Status](https://coveralls.io/repos/jfredett/eisegesis/badge.png?branch=master)](https://coveralls.io/r/jfredett/eisegesis)

Eisegesis is a tool for specifying a project structure, and how to compile it,
and just friggin' build it.

Eisegesis is a response to complexity. Eisegesis prefers convention to
configuration. It prefers simplicity in the face of often mind-searing levels of
complication and confusion. Autotools is overwrought, CMake is a phenomenal
improvement, but suffers the same fate. Every extant build system seeks to be
all things to all people. They deny the basic fact. People are wrong, and should
be told what to do most of the time.

Eisegesis aims to do that. Strong opinions and a consistent interface for adding
project automation tasks. It lets you weild the full power of Ruby to automate
tasks in your codebase. It automates parallel compiles. It automatically does
incremental compiles. It manages multiple compilers, multi-pass compilation, and
many other features.

Among it's present and planned features:

* Parallel Builds
* Distributed/Multi-machine Builds
* Incremental Compilation
* Multi-pass Compilation
* Full Force of Ruby and Rake to automate project tasks

## Naming

Eisegesis is the counterforce to Exegesis. Whereas Exegesis expounds upon a
topic, Eisegesis starts with the idea and seeks to support it. It's actually a
negative connotation. It's essentially starting with your conclusion and working
backwards to support it. I prefer to take the connotation that it takes all the
elements expounded by [Exegesis](http://www.github.com/jfredett/exegesis) (which
it uses to access the filesystem), and draws them back in to produce a final
product.

Also, I think it's a cool word.

## Installation

Add this line to your application's Gemfile:

    gem 'eisegesis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eisegesis

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
