# require 'printer'
# require 'game'
require 'CSV'
require_relative '../lib/messages'
require_relative '../lib/finder.rb'
# require_relative '../lib/entry'



class CLI
attr_reader :contents, :command #:answer, :printer, :instream, :outstream

  def initialize(instream, outstream)
   @command_entered = ""
   @instream  = instream
   @outstream = outstream
   @filename = "/event_attendees.csv"
   path = File.join(__dir__, @filename)
   @contents =  CSV.read(path, headers: true, header_converters: :symbol)
    #  @contents.each do |data|

      #  puts name
      #
    #  end
    puts contents.headers
     puts "this is entry1 #{contents[:state][0]}"
     @messages = Messages.new
   end

  def call
    until quit
    print @messages.command_prompt
    @command = gets.strip.downcase
    process_command(@command)
    puts " this is command #{@command}"
  end

  def load_file(filename)
    path = File.join(__dir__, filename)
    @contents = CSV.read(path, headers: true, header_converters: :symbol)
    # contents.each do |row|
    # name = row[2]
    # puts name
    puts @messages.file_load
  end

  end

  def process_command(command)
    attribute = command.split[1]
    puts "this is attribute #{attribute}"
    criteria = command.split[2]
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
    when help_queue_clear
      puts @messages.help_queue_clear
    when help_queue_print
      puts @messages.help_queue_print
    when help_queue_print_by
      puts @messages.help_queue_print_by
    when help_queue_count
      puts @messages.help_queue_count
    when help_queue_save_to
      puts @messages.help_queue_save_to
    when help_find
      puts @messages.help_find
    when find
      puts 'find!'
      self.clean_data
      finder = Finder.new(contents)
      finder.lookup(attribute, criteria)
    when queue
      puts 'queue!'
    when load
      if command.split.length == 2
        @filename = attribute
      end
      self.load_file(@filename)
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

  def help_queue
    @command == 'help queue'
  end

  def help_queue_print
    @command == 'help queue print'
  end

  def help_queue_clear
    @command == 'help queue clear'
  end

  def help_queue_print
    @command == 'help queue print'
  end

  def help_queue_print_by
    @command == 'help queue print by'
  end

  def help_queue_count
    @command == 'help queue count'
  end

  def help_queue_save_to
    @command == 'help queue save to'
  end

  def help_find
    @command == 'help find'
  end

  def load
    @command.split[0] == 'load'
  end

  def find
    @command.split[0] == 'find' || @command.split[0] == 'f'
  end

  def queue
    @first_command== 'queue'
  end

  def clean_data
    #take each column and process it
    @contents[:zipcode] = @contents[:zipcode].map{|zipcode| zipcode.to_s.rjust(5,'0')}
    @contents[:first_name] = @contents[:first_name].map(&:downcase)
    @contents[:last_name] = @contents[:last_name].map(&:downcase)
    @contents[:email_address] = @contents[:email_address].map(&:downcase)
    @contents[:homephone] = @contents[:homephone].map{|phone| phone.gsub!(/\D/,'')}
    @contents[:city] = @contents[:city].map do|city|
       unless city.nil?
       city.downcase
       end
     end
    @contents[:state] = @contents[:state].map do|state|
      unless state.nil?
        state.downcase
      end
    end

    #first_name = data[:first_Name]
    # last_name = data[:last_Name]
    # email = data[:Email_Address]
    # phone = data[:HomePhone]
    # street = data[:Street]
    # city = data[:City]
    # state = data[:State]
    # zipcode = data[:Zipcode]
  end

  def finder(attribute,criteria)
    puts "the attribute is #{attribute}, criteria is #{criteria}"
  end


end
