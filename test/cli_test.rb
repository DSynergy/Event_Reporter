require_relative 'test_helper'
require_relative '../bin/cli'

class CLI_test < Minitest::Test

  def setup
    @cli = CLI.new($stdin, $stdout)
  end

  def test_load
    assert @cli.respond_to?(:load)
  end

  def test_help
    assert @cli.respond_to?(:help)
  end

  def test_queue
    assert @cli.respond_to?(:queue)
  end

  def test_find
    assert @cli.respond_to?(:find)
  end


end
