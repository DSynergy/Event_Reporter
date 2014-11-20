class CSV_processor

  def initialize(filename = 'garbage.csv', queue)
    @path = File.join('./bin/', filename)
    @queue = queue
  end

  def format_output
     puts  "LAST NAME       FIRST NAME      EMAIL                           ZIPCODE         CITY                    STATE           ADDRESS                         PHONE"
     queue_rows = @queue.map {|row| "#{row[:last_name].ljust(10, " ")}\t#{row[:first_name].ljust(10, " ")}\t#{row[:email_address].ljust(30, " ")}\t#{row[:zipcode].ljust(9, " ")}\t#{row[:city].ljust(20, " ")}\t#{row[:state].ljust(10, " ")}\t#{row[:street].ljust(30, " ")}\t#{row[:homephone]}\n"}
     puts queue_rows
  end

  def print_to_file
    CSV.open(@path, 'w') do |csv|
        csv << ["#","RegDate","first_Name","last_Name","Email_Address","HomePhone","Street","City","State","Zipcode"]
          @queue.each do |element|
            csv.puts element
          end
        end
  end
end
