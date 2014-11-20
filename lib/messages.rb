class Messages

  def initialize(outstream)
    @outstream = outstream
  end

  def help
    @outstream.puts "The available commands are: load, queue, queue count, queue clear, queue print, queue print by <attribute>, queue save to <filename.csv>, and find <attribute> <criteria>. Type 'help <command>' for more info.
    \nThe list of attributes includes: last name, first name, email, zipcode, city, state, address and phone number.
    \nThe list of criteria includes the desired entry under the attributes. Example: all attendees with the last name <attribute> of Gault <criteria>"
  end

  def command_prompt
    @outstream.print "Please enter your command (enter 'help' for info)>>>>"
  end

  def help_load
    @outstream.puts "The load command will load a CSV file. This defaults to event_attendees.csv, unless otherwise specified by typing load <filename>. This will erase any previously loaded data."
  end

  def help_queue
    @outstream.puts "The queue stores all your searches until you: 1) clear the queue with the clear queue command; 2) exit; or 3) start a new query by using the find command."
  end

  def help_find
    @outstream.puts "The find command allows you to search the CSV file by attribute and criteria by find <attribute> <criteria>.
    /n The list of attributes includes: last name, first name, email, zipcode, city, state, address, and phone number.
    /n The list of criteria includes the desired entry under the attributes. Example: all attendees with the last name <attribute> of Gault <criteria>"
  end

  def help_queue_clear
    @outstream.puts "Queue clear empties the queue and resets the queue count."
  end

  def help_queue_print
    @outstream.puts "Queue print will print out a data table consisting of the entries in your current queue."
  end

  def help_queue_print_by
    @outstream.puts "Queue print by <attribute> will print the data table sorted by the specified attribute, such as zipcode."
  end

  def help_queue_count
    @outstream.puts "Queue count gives an output of how many records are currently in the queue."
  end

  def help_queue_save_to
    @outstream.puts "Queue save to <filename> will save the current queue to a new CSV file with the given <filename>."
  end

  def invalid_command
    @outstream.puts "I didn't quite understand that. Type 'help' for a list of commands"
  end

  def intro_message
   @outstream.puts " Welcome to the one, the only,
      ______                 __     ____                        __
     / ____/   _____  ____  / /_   / __ \___  ____  ____  _____/ /____  _____
    / __/ | | / / _ \/ __ \/ __/  / /_/ / _ \/ __ \/ __ \/ ___/ __/ _ \/ ___/
   / /___ | |/ /  __/ / / / /_   / _, _/  __/ /_/ / /_/ / /  / /_/  __/ /
  /_____/ |___/\___/_/ /_/\__/  /_/ |_|\___/ .___/\____/_/   \__/\___/_/
                                          /_/
  "
  end

  def quit
  @outstream.puts "
    ____              __     __                         __
   / __ \____  ____  / /_   / /  ___  ____ __   _____  / /
  / / / / __ \/ __ \/ __/  / /  / _ \/ __ `/ | / / _ \/ /
 / /_/ / /_/ / / / / /_   / /___  __/ /_/ /| |/ /  __/_/
/_____/\____/_/ /_/\__/  /_____\___/\__,_/ |___/\___(_)

  There are more events to report and more CSVs to explore!"

  end

  def file_load
    @outstream.puts "Your file has been loaded correctly. Huzzah"
  end
end
