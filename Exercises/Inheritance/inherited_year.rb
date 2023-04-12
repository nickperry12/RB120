# Inherited Year

# Using the following code, create two classes - Truck and Car - that both
# inherit from Vehicle.

=begin
Create subclasses `Car` and `Truck` that inherit from the superclass `Vehicle`.
To get a class to inherit behaviors from another, using the symbol `<` followed
by the name of the superclass, and append both to the subclass name.
=end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year