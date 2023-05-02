# Refactoring Vehicles

# Consider the following classes... Refactor these classes so they all use a
# common superclass, and inherit behavior as needed

=begin
Modeling:

We have 3 classes: Car, Motorcycle, Truck

Need to have it inherit from the superclass
- Can move the `initialize` method into the superclass
  - Exception is the `Truck` class as it has a 3rd parameter
    - In this case, have it's own method that uses the `super` method to assign
      the arguments to their respect instance variables, and then assign the
      third parameter within that method
- Can also move the `attr_reader` method into the superclass
=end

class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEELS
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  WHEELS = 4

  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

class Plane < Vehicle
  WHEELS = 0
end

mytruck = Truck.new("RAM", "3500", "100kg")
puts mytruck.wheels # => 4

myplane = Plane.new("Boeing", "737")
puts myplane.wheels # => 0

# Would it make sense to define a wheels method in Vehicle even though all of
# the remaining classes would be overriding it? Why or why not? If you think it
# does make sense, what method body would you write?

=begin
I think it would make sense to use a `wheels` instance method in the superclass,
as it reduces the repetitiveness of having the same method within each subclass.
However, there is the issue that not all vehicles have wheels. We can use the
class `Plane` as an example; a plane has no wheels. A work around for this would
be to initialize a constant variable in each class to the amount of wheels that
class (type of vehicle) has, and have the instance method `wheels` within
`Vehicles` return the value referenced by that constant.
=end