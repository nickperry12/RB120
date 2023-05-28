class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end


# What can executing `Triangle.sides` return? What can executing
# `Triangle.new.sides` return? What does this demonstrate about class variables?

=begin
The return value of executing the class method `Triangle::sides` will depend on
whether or not an object of the `Triangle` or `Quadrilateral` classes have been
instantiated. If we instantiate an object from the `Triangle` class and
immediately call `Triangle::sides`, it will return 3. If we instantiate an
object from the `Quadrilateral` class and call `Triangle::sides` after, it will
return 4. If no objects have been instantiated, it will return `nil`. 

When we call `Triangle.new.sides` it will return 3 every time because when we
instantiate a new `Triangle` object, the constructor method `initialize` is
called, initializing `@@sides` to 3. This demonstrates that class variables are
shared between superclasses and subclasses, and why it's generally a good idea
to avoid using class variables when working with inheritance. If we have a class
variable initialized in a superclass or subclass, and it's reassigned to a value
within another class, it can lead to bugs in our program if this was done with
intention.
=end
