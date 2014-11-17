#!/usr/bin/env ruby

bin_dir = File.expand_path('', __dir__)
lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir, bin_dir)


require 'cli'

CLI.new($stdin, $stdout).call
