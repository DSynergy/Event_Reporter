require_relative 'test_helper'

class ReadingTest < MiniTest::Test
  attr_accessor :cli

  def setup
    @output = StringIO.new
    @cli = CLI.new($stdin, @output)
    cli.process_command("load")
  end

  def test_responds_to_find_by_state
    cli.process_command("load")
    cli.process_command("find state md")
    assert_equal 294, cli.finder.queue_counter
  end

  def test_responds_to_queue_save
    cli.process_command("load")
    cli.process_command("find state md")
    cli.process_command("queue save to state_sample.csv")
    statefile = File.open("./bin/state_sample.csv", "r")
    assert_equal "#,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode", statefile.gets.chomp
    assert_equal "7,11/12/08 16:05,mary kate,curry,wmppydaymaker@jumpstartlab.com,2023281000,1509 Jackson Street,baltimore,md,21230", statefile.gets.chomp
  end

  # def test_quit_command
  #   skip
  #   assert_equal cli.process_command("quit"), @messages.quit
  # end

  # def test_responds_to_load_filename_after_saving
  #   skip
  #   cli.process_command("load")
  #   cli.process_command("find state md")
  #   cli.process_command("queue save to state_sample.csv")
  #   cli.process_command("load state_sample.csv")
  #   assert @messages.file_load
  #   # assert_equal 'Successfully loaded state_sample.csv.', reporter.process_and_execute("load state_sample.csv")
  # end

  def test_responds_to_find_by_first_name
    cli.process_command("load state_sample.csv")
    cli.process_command("find first_name john")
    assert_equal 4, cli.finder.queue_counter
  end
end
