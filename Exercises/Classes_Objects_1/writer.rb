# Writer

# Using the code from the previous exercise, add a setter method named #name=.
# Then, rename kitty to 'Luna' and invoke #greet again.

# Code:

=begin
We can either define a setter method `name=` or we can change the `attr_reader`
method and instead call the `attr_accessor` method that will create both setter
and getter methods. 
=end

class Cat
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet