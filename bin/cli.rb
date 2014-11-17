# require 'printer'
# require 'game'
require 'csv'

class CLI
#  attr_reader :answer, :printer, :instream, :outstream

   def initialize(instream, outstream)
     @command_entered = ""
#     @printer  = Printer.new
     @instream  = instream
     @outstream = outstream
   end

  def call
    until quit?
    print messages["command_prompt"]
    command_entered = gets.strip.downcase
    process_command(command_entered)
  end
  end

  def process_command(command)


  end

  def load
    filename = "../lib/event_attendees.csv"
    contents = CSV.open filename, headers: true, header_converters: :symbol
    # contents.each do |row|
    # name = row[2]
    # puts name
    puts "file has been loaded"
  end

  def help
    puts messages["help"]
  end

  def queue
    []
  end

  def find
  end

  def quit?
    false
  end
end
