# What Will This Do?

# What will the following code print?

class Something
  def initialize
    @data = 'Hello' # initialized instance variable @data to the string "hello"
  end

  def dupdata # this is an instance method
    @data + @data # this concatenates the string referenced by @data with @data
  end

  def self.dupdata # this is a class method
    'ByeBye' # returns the string "ByeBye"
  end
end

thing = Something.new
puts Something.dupdata # this outputs "ByeBye"
puts thing.dupdata # this outputs "HelloHello"