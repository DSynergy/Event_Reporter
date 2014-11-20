# require 'simplecov'
# SimpleCov.start
require_relative 'test_helper'

class EmptinessTest < MiniTest::Test
  attr_accessor :cli

  def setup
    @output = StringIO.new
    @cli = CLI.new($stdin, @output)
    @messages = Messages.new(@output)
    cli.process_command("load state_sample.csv")
  end

  def test_queue_count_is_zero_when_name_is_not_found
    cli.process_command("find last_name johnson")
    assert_equal 0, cli.finder.queue_counter
  end

  def test_queue_to_queue_clear
    cli.process_command("queue clear")
    assert_equal [], cli.finder.queue2
  end

  # def test_prints_nothing_on_queue_print_by_attribute_when_queue_is_empty
  #
  #   # assert_equal "Print was unsuccessful because the queue was empty. Try running 'load' followed by a 'find' command first.", reporter.process_and_execute("queue print by last_name")
  # end

  def test_responds_to_queue_save_an_empty_file
    cli.process_command("queue save to empty.csv")
    emptyfile = File.open('./bin/empty.csv', "r")
    assert_equal "#,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode", emptyfile.gets.chomp
    assert_equal nil, emptyfile.gets
  end

  def test_queue_count_defaults_to_zero_after_emptiness_tests
    cli.process_command("queue save to empty.csv")
    emptyfile = File.open('./bin/empty.csv', "r")
    assert_equal "#,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode", emptyfile.gets.chomp
    assert_equal nil, emptyfile.gets
    assert_equal 0, cli.finder.queue_counter
  end
end
