class Messages

  def help
    puts "The available commands are: load, queue, queue count, queue clear, queue print, queue print by <attribute>, queue save to <filename.csv>, and find <attribute> <criteria>. Type 'help <command>' for more info.
    /n The list of attributes includes: last name, first name, email, zipcode, city, state, address and phone number.
    /n The list of criteria includes the desired entry under the attributes. Example: all attendees with the last name <attribute> of Gault <criteria>"
  end

  def command_prompt
    puts "Please enter your command (enter 'help' for info)>>>>"
  end

  def file_load
    puts "The file has been loaded"
  end

  def help_load
    puts "The load command will load a CSV file. This defaults to event_attendees.csv, unless otherwise specified by typing load <filename>. This will erase any previously loaded data."
  end

  def help_queue
    puts "The queue stores all your searches until you: 1) clear the queue with the clear queue command; 2) exit; or 3) start a new query by using the find command."
  end

  def help_find
    puts "The find command allows you to search the CSV file by attribute and criteria by find <attribute> <criteria>.
    /n The list of attributes includes: last name, first name, email, zipcode, city, state, address, and phone number.
    /n The list of criteria includes the desired entry under the attributes. Example: all attendees with the last name <attribute> of Gault <criteria>"
  end

  def help_queue_clear
    puts "Queue clear empties the queue and resets the queue count."
  end

  def help_queue_print
    puts "Queue print will print out a data table consisting of the entries in your current queue."
  end

  def help_queue_print_by
    puts "Queue print by <attribute> will print the data table sorted by the specified attribute, such as zipcode."
  end

  def help_queue_count
    "Queue count gives an output of how many records are currently in the queue."
  end

  def help_queue_save_to
    "Queue save to <filename> will save the current queue to a new CSV file with the given <filename>."
  end

  def format_output(queue)
   puts  "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    puts"puts this is queue's class #{queue.flatten.class}"
   queue_rows = queue.map {|row| " #{row[:last_name]}\t#{row[:first_name]}\t#{row[:email_address]}\t#{row[:zipcode]}\t#{row[:city]}\t#{row[:state]}\t#{row[:address]}\t#{row[:homephone]}"}
   puts queue_rows


  end

  #empty_queue_error_message



end
