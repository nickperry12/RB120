# Counting Cats

# Using the following code, create a class named Cat that tracks the number of
# times a new Cat object is instantiated. The total number of Cat instances
# should be printed when ::total is invoked.

=begin
In this solution we're going to be using class variables as a means of keeping
track of the amount of objects of the Cat class that have been instantiated.
We can define a method `initialize` that increments the integer referenced by
this variable by 1 every time the method is invoked.

Remember, `initialize` is what's called a constructor method, and is invoked
each time a new object is instantiated.
=end

class Cat
  @@number_of_cats = 0

  def initialize
    @@number_of_cats += 1
  end

  def self.total
    @@number_of_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total