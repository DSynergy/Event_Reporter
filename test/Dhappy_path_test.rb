require_relative 'test_helper'
# require_relative '../events'
require_relative '../bin/cli'


class HappyPathTest < MiniTest::Test
  attr_reader :reporter

  def setup
    @reporter = CLI.new($stdin, $stdout)
    # reporter.process_and_execute("load")
  end

  def test_load_responds_to_load_command
    assert reporter.respond_to?(:load)
  end

  def test_that_it_loads_the_default_file
    skip
    reporter.load
    refute reporter.contents == nil
  end

  def test_queue_count_defaults_to_zero
    assert_equal 0, reporter.process_commmand("queue count")
  end

  def test_responds_to_find_by_first_name
    reporter.process_command("find first_name John")
    assert_equal 63, reporter.process_command("queue count")
    # reporter.process_and_execute("find first_name John")
    # assert_equal 63, reporter.process_and_execute("queue count")
  end

  def test_responds_to_queue_clear
    skip
    reporter.process_command("queue clear")
    assert_equal 0, reporter.process_command("queue count")
    # reporter.process_and_execute("queue clear")
    # assert_equal 0, reporter.process_and_execute("queue count")
  end

  def test_help
    assert reporter.respond_to?(:help)
  end

  def test_responds_to_help_queue_count_command
    assert reporter.respond_to?(:help_queue_command)
    # assert_equal show_help_queue_count, reporter.process_and_execute("help queue count")
  end

  def test_responds_to_help_queue_print_command
    # assert_equal show_help_queue_print, reporter.process_and_execute("help queue print")
  end

  def summarize_help
    # "\n\t\t*** EventReporter Help ***\n\n\n    \n\t\tEvent Reporter helps analyze data in csv files that contain contact\n    \t\tinformation such as names, addresses, and phone numbers. To get started,\n    \t\tuse the 'load' command to load a csv file. Then, use 'find' to sort data by\n    \t\ta column name from the CSV (such as: 'first_name'). To figure out the valid\n    \t\tsearch terms, read the headers in the CSV file you want to search. The found\n    \t\tdata will be stored in a 'queue'. You can access and perform operations on the\n    \t\tqueue using the 'queue' command.\n\n\n\t\t*** Commands ***\n\n\n    \n\t\tload <filename.csv>: loads the specified file into EventReporter\n\n\t\tfind <column> <criteria>: searches the loaded csv file for all rows \n\t\tmatching the given column and adds them to the queue if they match the criteria\n\n\t\tqueue <subcommand>: accesses and manipulates the queue of found data\n    \t\tType 'help <command>' to read more about a specific command."
  end

  def show_help_queue_count
    # "queue count: Reports the number of records that matched the last search."
  end

  def show_help_queue_print
    # "queue print: Prints a table showing the data in the result queue./nqueue print by <column>: Prints a table sorted by the specified column name."
  end

end
