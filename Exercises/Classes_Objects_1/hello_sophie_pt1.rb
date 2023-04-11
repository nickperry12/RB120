# Hello, Sophie! (Part 1)

# Using the code from the previous exercise, add a parameter to #initialize that
# provides a name for the Cat object. Use an instance variable to print a
# greeting with the provided name. (You can remove the code that displays I'm a
# cat!.)

# Code:

class Cat
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def my_name
    puts "My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.my_name