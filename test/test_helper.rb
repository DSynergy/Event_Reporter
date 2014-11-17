bin_dir = File.expand_path('../bin', __dir__)
lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir, bin_dir, __dir__)

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
