# Generic Greeting (Part 1)

# Modify the following code so that Hello! I'm a cat! is printed when
# Cat.generic_greeting is invoked.

=begin
We're creating a method that is a general method for that class, that doesn't
involve writing or reading any instance variables. This tells us that we can
define a class method. Class methods are used when the behavior pertains to the
class as a whole, not a specific instance of that class. To define a class
method, we prepend `self` to the beginning of the method name.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
Cat.generic_greeting

# Further Exploration
# What happens if you run kitty.class.generic_greeting? Can you explain this result?

kitty.class.generic_greeting

=begin
This will output the same thing as `Cat.generic_greeting`. This is because we
are calling the `#class` method on the object `kitty`, which returns the class
that object belongs to, in this case `Cat`. We are then calling the class method
`::generic_greeting` on that returned value, which again, is the class the
`kitty` object belongs to.
=end