# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'

class EmptinessTest < MiniTest::Test
  attr_accessor :cli

  def setup
    @output = StringIO.new
    @cli = CLI.new($stdin, @output)
    @messages = Messages.new(@output)
  end

  def test_queue_count_is_zero_when_name_is_not_found
    @cli.process_command("find last_name Johnson")
    # @cli.process_command("queue count")
    assert_equal 0, @cli.finder.queue2
  end

  def test_queue_to_queue_clear
    @cli.process_command("queue clear")
    assert_equal [], @cli.finder.queue2
  end

  def test_test_prints_nothing_on_queue_print_by_attribute_when_queue_is_empty
    skip
    # assert_equal "Print was unsuccessful because the queue was empty. Try running 'load' followed by a 'find' command first.", reporter.process_and_execute("queue print by last_name")
  end

  def test_responds_to_queue_save_an_empty_file
    skip
    # reporter.process_and_execute("queue save empty.csv")
    # emptyfile = File.open('empty.csv', "r")
    # assert_equal "id,regdate,first_name,last_name,email_address,homephone,street,city,state,zipcode", emptyfile.gets.chomp
    # assert_equal nil, emptyfile.gets
  end

  def test_queue_count_defaults_to_zero_after_emptiness_tests
    skip
    # reporter.process_and_execute("queue save empty.csv")
    # emptyfile = File.open('empty.csv', "r")
    # assert_equal "id,regdate,first_name,last_name,email_address,homephone,street,city,state,zipcode", emptyfile.gets.chomp
    # assert_equal nil, emptyfile.gets
    # assert_equal 0, reporter.process_and_execute("queue count")
  end
end
