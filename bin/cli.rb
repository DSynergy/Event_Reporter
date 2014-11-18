require 'CSV'
require_relative '../lib/messages'
require_relative '../lib/finder.rb'


class CLI
attr_reader :contents, :command

  def initialize(instream, outstream)
    @command_entered = ""
    @instream  = instream
    @outstream = outstream
    @filename = "/event_attendees.csv"
    path = File.join(__dir__, @filename)
    @contents =  CSV.read(path, headers: true, header_converters: :symbol)
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
  end

  def load_file(filename="/event_attendees.csv")
    path = File.join(__dir__, filename)
    @contents = CSV.read(path, headers: true, header_converters: :symbol)
    puts @messages.file_load
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
      finder.queue_count
    when queue
      puts 'queue!'
    when load?
      if command.split.length == 2
        filename = attribute
        self.load_file(filename)
      end
      self.load_file
    else
      puts 'invalid command'
    end
  end

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

  def load?
    @command.split[0] == 'load'
  end

  def find
    @command.split[0] == 'find' || @command.split[0] == 'f'
  end

  def queue
    @first_command== 'queue'
  end

  def clean_data
    @contents[:zipcode] = @contents[:zipcode].map{|zipcode| zipcode.to_s.rjust(5,'0')}
    @contents[:first_name] = @contents[:first_name].map(&:downcase)
    @contents[:last_name] = @contents[:last_name].map(&:downcase)
    @contents[:email_address] = @contents[:email_address].map(&:downcase)
    @contents[:homephone] = @contents[:homephone].map do |phone|
      if phone.nil?
        phone = "0000000000"
      else
      phone.gsub!(/\D/,'')
      end
    end
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
  end

  def finder(attribute,criteria)
    puts "the attribute is #{attribute}, criteria is #{criteria}"
  end
end
