require_relative 'test_helper'

class ReadingTest < MiniTest::Test
  attr_accessor :cli

  def setup
    @output = StringIO.new
    @cli = CLI.new($stdin, @output)
    cli.process_command("load")
  end

  def test_responds_to_load_filename
    skip
    # reporter.process_and_execute("load")
    # assert_equal 'Successfully loaded event_attendees.csv.', reporter.process_and_execute("load")
  end

  def test_responds_to_find_by_state
    skip
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # assert_equal 294, reporter.process_and_execute("queue count")
  end

  def test_responds_to_queue_save
    skip
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # reporter.process_and_execute("queue save state_sample.csv")
    # statefile = File.open("state_sample.csv", "r")
    # assert_equal "id,regdate,first_name,last_name,email_address,homephone,street,city,state,zipcode", statefile.gets.chomp
    # assert_equal "7,11/12/08 16:05,Mary kate,Curry,wmppydaymaker@jumpstartlab.com,2023281000,1509 Jackson Street,Baltimore,MD,21230", statefile.gets.chomp
  end

  def test_quit_command
    skip
    # assert_equal "Goodbye! Event Reporter is shutting down.\n\n", reporter.process_and_execute("quit")
  end

  def test_responds_to_load_filename_after_saving
    skip
    # assert_equal 'Successfully loaded state_sample.csv.', reporter.process_and_execute("load state_sample.csv")
  end

  def test_responds_to_find_by_first_name
    skip
    # reporter.process_and_execute("load")
    # reporter.process_and_execute("find state MD")
    # reporter.process_and_execute("queue save state_sample.csv")
    # statefile = File.open("state_sample.csv", "r")
    # assert_equal 'Successfully loaded state_sample.csv.', reporter.process_and_execute("load state_sample.csv")
    # reporter.process_and_execute("find first_name John")
    # assert_equal 4, reporter.process_and_execute("queue count")
  end
end
