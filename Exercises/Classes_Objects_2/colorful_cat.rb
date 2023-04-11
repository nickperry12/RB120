# Colorful Cat

# Using the following code, create a class named Cat that prints a greeting when
# #greet is invoked. The greeting should include the name and color of the cat.
# Use a constant to define the color.
=begin
In this solution, we're using a constant variable for the color of the cat and
an instance variable for the name of the cat. We can reference both using string
interpolation, as well as with the use of the `attr_reader` method which gives us
a getter method that we can reference inside of the `greet` method.
=end

class Cat
  attr_reader :name

  COLOR = "orange"

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! My name is #{name} and I'm an #{COLOR} cat!"
  end
end


kitty = Cat.new('Sophie')
kitty.greet