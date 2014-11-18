# require 'printer'
# require 'game'
require 'CSV'
require_relative '../lib/messages'



class CLI
attr_reader :contents, :command #:answer, :printer, :instream, :outstream

   def initialize(instream, outstream)
     @command_entered = ""
     @instream  = instream
     @outstream = outstream
     @contents = ''
     @filename = "/event_attendees.csv"
     @messages = Messages.new
     @path = File.join(__dir__, @filename)

   end

  def call
    until quit
    print @messages.command_prompt
    @command = gets.strip.downcase
    process_command(@command)
  end
  end

  def process_command(command)
    # @first_command = command.split[0]
    # puts @first_command
    case
    when quit
      puts 'quit!'
      exit
    when help
      puts @messages.help
    when help_load
      puts @messages.help_load
    when help_queue
      puts @messages.help_queue
    when help_find
      puts @messages.help_find
    when find
      puts 'find!'
    when queue
      puts 'queue!'
    else
      puts 'invalid command'
    end
  end


    #take in command entered
    #turn into an array
    #evaluate the first member and send to submethods


  def quit
    @command == 'quit' || @command == 'q'
  end

  def help
    @command == 'help' || @command == 'h'
  end

  def help_load
    @command == 'help load'
  end



  def load
    @command == 'load' || @command == 'l'
  end


  def find
    @first_command == 'find' || @first_command == 'f'
  end

  def queue
    @first_command== 'queue'
  end


  def load_file
    @contents = CSV.open(@path, headers: true, header_converters: :symbol)
    # contents.each do |row|
    # name = row[2]
    # puts name
    puts @messages['file_load']
  end

end
