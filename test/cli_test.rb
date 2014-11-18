require_relative 'test_helper'
require_relative '../bin/cli'
require 'yaml'


class CLI_Test < Minitest::Test

  def setup
    @cli = CLI.new($stdin, $stdout)
  end

  def test_load
    assert @cli.respond_to?(:load)
  end

  def test_that_it_loads_THE_file
    @cli.load
    refute @cli.contents == nil
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

  def test_process_commands
    @cli.call
    assert @cli.command != nil

  end


end
