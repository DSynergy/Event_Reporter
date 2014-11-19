require_relative 'test_helper'
require_relative '../lib/event_reporter.rb'

class PrintingTest < MiniTest::Test
  attr_accessor :reporter

  def setup
    @reporter = EventReporter.new
    reporter.process_and_execute("load")
  end

  def test_responds_to_load_filename
    # assert_equal 'Successfully loaded event_attendees.csv.', reporter.process_and_execute("load event_attendees.csv")
  end

  def test_queue_count_defaults_to_zero
    # assert_equal 0, reporter.process_and_execute("queue count")
  end

  def test_responds_to_find_by_first_name
    # reporter.process_and_execute("find first_name John")
    # assert_equal 63, reporter.process_and_execute("queue count")
  end

  def test_responds_to_find_by_another_first_name
    # reporter.process_and_execute("find first_name Mary")
    # assert_equal 16, reporter.process_and_execute("queue count")
  end

  def test_responds_to_queue_print
    # reporter.process_and_execute("find first_name Mary")
    # assert "#{reporter.process_and_execute("queue print")}".end_with?("Successfully printed 16 queue items.")
  end

  def test_responds_to_queue_print_by_last_name
    # reporter.process_and_execute("find first_name Mary")
    # assert reporter.process_and_execute("queue print by last_name").end_with?("Successfully printed 16 queue items by last_name.")
    # assert_equal 16, reporter.process_and_execute("queue count")
  end

end
