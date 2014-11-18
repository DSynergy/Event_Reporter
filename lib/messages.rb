class Messages

  def help
    puts "The available commands are load, queque, queque count, queque clear, queue print, queue print by <attribute>, queue save to <filename.csv>, find <attribute> <criteria>."
  end

  def command_prompt
    puts "Please enter your command (enter 'help' for info)."
  end

  def file_load
    puts "The file has been loaded"
  end

  def help_load
    puts "Load defaults to event_attendees.csv. Otherwise, if you want to load a different file, type load <filename>"
  end

  def help_queue
    puts "The queue stores all your searches until you exit, or start a new query by the find command, or with the queue clear command"
  end

  def help_find
    puts ""
  end

  def help_queue_clear
  end

  def help_queue_print
  end

  def help_queue_print_by
  end

  def help_queue_count
  end

  def help_queue_save_to
  end

end
