# Transportation

# Create a module named Transportation that contains three classes: Vehicle,
# Truck, and Car. Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle
  end
  
  class Truck < Vehicle
  end
  
  class Car < Vehicle
  end
end

puts Transportation::Car.ancestors
puts "------------"
puts Transportation.ancestors

=begin
We can add classes within a module. This is useful for namespacing. Namespacing
is where similar classes are grouped within a module. This makes it easier to
recognize the purpose of the contained classes. Groupin classes in a module can
also help avoid collision with classes of the same name.

To instantiate a class that's contained in a module we can use the following
syntax:

`Transportation::Truck.new`
=end