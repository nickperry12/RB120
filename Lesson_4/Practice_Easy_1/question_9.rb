# Question 9

# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# We would need to call the `new` method on the `Bag` class. This will
# instantiate a new object (instance) of the calling class. Because the
# `initialize` constructor method has two parameters, we must pass in two
# arguments into the `new` method when instantiating a new object of the `Bag`
# class.

Bag.new("red", "silk")