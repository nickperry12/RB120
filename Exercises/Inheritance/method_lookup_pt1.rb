# Method Lookup (Part 1)

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes that were checked by Ruby when searching for
# the #color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
puts cat1.class.ancestors

=begin
We know that Ruby will first check the the class of the object that is calling
the method, and if it doesn't find it there, it will look further up the class
hierarchy. 

Cat => Animal

We can confirm this by using the `ancestors` method. (This will include all the
ancestors of the `Cat` class.)
=end