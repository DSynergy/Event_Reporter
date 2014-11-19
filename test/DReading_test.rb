require_relative 'test_helper'
require_relative '../lib/event_reporter.rb'

class ReadingTest < MiniTest::Test
  attr_accessor :reporter

  def setup
    @reporter = EventReporter.new
    reporter.process_and_execute("load")
  end

  def test_responds_to_load_filename
    # reporter.process_and_execute("load")
    # assert_equal 'Successfully loaded event_attendees.csv.', reporter.process_and_execute("load")
  end

  def test_responds_to_find_by_state
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # assert_equal 294, reporter.process_and_execute("queue count")
  end

  def test_responds_to_queue_save
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # reporter.process_and_execute("queue save state_sample.csv")
    # statefile = File.open("state_sample.csv", "r")
    # assert_equal "id,regdate,first_name,last_name,email_address,homephone,street,city,state,zipcode", statefile.gets.chomp
    # assert_equal "7,11/12/08 16:05,Mary kate,Curry,wmppydaymaker@jumpstartlab.com,2023281000,1509 Jackson Street,Baltimore,MD,21230", statefile.gets.chomp
  end

  def test_quit_command
    # assert_equal "Goodbye! Event Reporter is shutting down.\n\n", reporter.process_and_execute("quit")
  end

  def test_responds_to_load_filename_after_saving
    # assert_equal 'Successfully loaded state_sample.csv.', reporter.process_and_execute("load state_sample.csv")
  end

  def test_responds_to_find_by_first_name
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # reporter.process_and_execute("queue save state_sample.csv")
    # statefile = File.open("state_sample.csv", "r")
    # assert_equal 'Successfully loaded state_sample.csv.', reporter.process_and_execute("load state_sample.csv")
    # reporter.process_and_execute("find first_name John")
    # assert_equal 4, reporter.process_and_execute("queue count")
  end

end
