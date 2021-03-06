require_relative 'test_helper'
# require_relative '../events'
require 'cli'


class HappyPathTest < MiniTest::Test
  attr_reader :cli, :messages

  def setup
    @cli = CLI.new($stdin, StringIO.new)
    @output = StringIO.new
    messages = Messages.new(@output)
  end

  def test_load_responds_to_load_command
    assert cli.respond_to?(:load_file)
  end

  def test_that_it_loads_the_default_file
    cli.process_command("load event_attendees.csv")
    refute cli.contents.empty?
  end

  def test_queue_count_defaults_to_zero
    cli.process_command("queue count")
    assert_equal 0, cli.finder.queue_counter
  end

  def test_responds_to_find_by_first_name
    cli.process_command("find first_name john")
    assert_equal 63, cli.finder.queue_counter
  end

  def test_responds_to_queue_clear
    cli.process_command("queue clear")
    assert_equal 0, cli.finder.queue_counter
  end

  def test_help
    assert cli.respond_to?(:help)
  end

  def test_responds_to_help_queue_count
    assert cli.respond_to?(:help_queue)
  end

  def test_responds_to_help_queue_print
    assert cli.respond_to?(:help_queue_print)
  end
end
