class Finder

  attr_reader :queue

  def initialize(contents)
    @queue = []
    @contents = contents
  end

  def lookup(attribute, criteria)
    @queue << @contents.select{|entry| entry[attribute.to_sym] == criteria }
    @queue = @queue.flatten
    puts "this is queue #{@queue}"
  end

  def queue_count
    puts @queue.count
  end
end
