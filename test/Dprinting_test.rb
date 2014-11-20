require_relative 'test_helper'

class PrintingTest < MiniTest::Test
  attr_accessor :cli

  def setup
    @output = StringIO.new
    @cli = CLI.new($stdin, @output)
    cli.process_command("load")

  end

  # def test_responds_to_load_filename
  #   skip
  #   cli.process_command("load fakefile.csv")
  #   assert_equal cli.process_command.respond_to?("load fakefile.csv")
  #   # assert_equal 'Successfully loaded event_attendees.csv.', reporter.process_and_execute("load event_attendees.csv")
  # end

  def test_queue_count_defaults_to_zero
    assert_equal 0, cli.finder.queue_counter
  end

  def test_responds_to_find_by_first_name
    cli.process_command("find first_name john")
    assert_equal 63, cli.finder.queue_counter
  end

  def test_responds_to_find_by_first_name
    cli.process_command("find first_name mary")
    assert_equal 16, cli.finder.queue_counter
  end

  # def test_responds_to_queue_print
  #   skip
  #   cli.process_command("find first_name mary")
  #   assert "#{cli.process_command("queue print")}".end_with?("4849953000")
  #   # reporter.process_and_execute("find first_name Mary")
  #   # assert "#{reporter.process_and_execute("queue print")}".end_with?("Successfully printed 16 queue items.")
  # end
  #
  # def test_responds_to_queue_print_by_last_name
  #   skip
  #   cli.process_command("find first_name mary")
  #   assert "#{cli.process_command("queue print by last_name")}".end_with?("some last name")
  #   # reporter.process_and_execute("find first_name Mary")
  #   # assert reporter.process_and_execute("queue print by last_name").end_with?("Successfully printed 16 queue items by last_name.")
  #   # assert_equal 16, reporter.process_and_execute("queue count")
  # end
end
