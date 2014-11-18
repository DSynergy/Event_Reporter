class Finder

  attr_reader :repository

  def initialize(contents)
    @queue = []
    @contents = contents
  end


  def lookup(attribute, criteria)

    #puts "this is content 1 #{@contents[:homephone]}"
    @queue << @contents.select{|entry| entry[attribute.to_sym] == criteria }
    puts "this is queue #{@queue}"
  end

  def reverse_lookup(number)
    repository.find_by_number(number)
  end


  # def first_name
  # zipcode
  # email
  # city
  # state
  # address
  # phone
  # def find_by_last_name(last_name)
  #   entries.select{|entry| entry.last_name == last_name}
  # end

end
