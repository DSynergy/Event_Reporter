class CSV_processor

  def initialize(filename = 'garbage.csv', queue)
    @filename = filename
    @queue = queue
  end

  def format_output
     puts  "LAST NAME       FIRST NAME       EMAIL      ZIPCODE     CITY      STATE     ADDRESS      PHONE"
     queue_rows = @queue.map {|row| "#{row[:last_name].ljust(10, " ")}\t#{row[:first_name].ljust(10, " ")}\t#{row[:email_address].ljust(20, " ")}\t#{row[:zipcode].ljust(10, " ")}\t#{row[:city].ljust(20, " ")}\t#{row[:state].ljust(10, " ")}\t#{row[:street].ljust(30, " ")}\t#{row[:homephone]}\n"}
     puts queue_rows
  end


  def print_to_file
    queue_rows = @queue.map {|row| "#{row[:regdate]}\t#{row[:last_name]}\t#{row[:first_name]}\t#{row[:email_address].ljust(30, " ")}\t#{row[:zipcode]}\t#{row[:city]}\t#{row[:state]}\t#{row[:street]}\t#{row[:homephone]}\n"}
    puts "queue_rows class is #{queue_rows.class} size is #{queue_rows.size}"
    queue_rows.unshift("REG DATE LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE\n")
    CSV.open(@filename, 'w') do |row|
    row << queue_rows
    end
  end
end
