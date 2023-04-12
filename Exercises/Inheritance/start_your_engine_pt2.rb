# Start the Engine (Part 2)

# Given the following code, modify #start_engine in Truck by appending 'Drive
# fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in
# 'Drive fast, please!' should be the value of speed.

=begin
We have two `start_engine` methods, one in the `Vehicle` superclass and another
within the `Truck` subclass. To solve this problem, we can invoke the `super`
method within the `start_engine` method definition that is inside of the `Truck`
subclass. This will invoke `start_engine` from within `Vehicle`, and then we can
append the necessary string.

Possible problem:

Our `start_engine` method within `Vehicle` does not accept a parameter, while
the `start_engine` method within `Truck` does. We might get an ArgumentError
thrown. 
=end

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + ' ' + "Drive #{speed}km/h, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine(60)