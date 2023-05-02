# Write a class that will display:

# ABC
# xyz

# When the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def uppercase
    self.string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')