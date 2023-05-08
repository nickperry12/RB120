# Question 7

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# The `@@cats_count` variable is a class variable. Class variables are scoped at
# the class level. `@@cats_count` is initialized to `0`, and upon each
# instantiation of a new object of the `Cat` class, the variable will be
# reassigned to the return value the current value plus 1. 

# The purpose of this variable is to keep track of how many objects of the `Cat`
# class have been instantiated. To test this, we can instantiate objects of the
# class, and then call the class method `cats_count` on the `Cats` class. This
# method will return the value referenced by the `@@cats_count` class variable.

mittens = Cat.new("tabby")
fluffy = Cat.new("calico")
prinkles = Cat.new("persian")

p Cat.cats_count # => 3