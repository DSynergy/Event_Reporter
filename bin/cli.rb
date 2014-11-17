# require 'printer'
# require 'game'
require 'CSV'
require 'yaml'



class CLI
attr_reader :contents #:answer, :printer, :instream, :outstream

   def initialize(instream, outstream)
     @command_entered = ""
#     @printer  = Printer.new
     @instream  = instream
     @outstream = outstream
     @contents = ''
     @filename = "/event_attendees.csv"
     @messages = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), "messages.yaml")))
     @path = File.join(__dir__, @filename)

   end

  def call
    until quit
    print @messages["command_prompt"]
    @command = gets.strip.downcase
    process_command(@command)
  end
  end

  def process_command(command)
    case
    when quit
      puts 'quit!'
      exit
    when help
      puts 'help!'
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

  def load
    @command == 'load' || @command == 'l'
  end


  def find
    @command == 'find' || @command == 'f'
  end

  def queue
    @command == 'queue'
  end


  def load_file
    @contents = CSV.open(@path, headers: true, header_converters: :symbol)
    # contents.each do |row|
    # name = row[2]
    # puts name
    puts @messages['file_load']
  end

end
