# Start the Engine (Part 1)

# Change the following code so that creating a new Truck automatically invokes
# #start_engine.

=begin
We can move the `start_engine` method into the `Vehicle` superclass, and then
call that method within the constructor method `initialize`, so it's called
every time a new object of the `Truck` or `Vehicle` class is instantiated.
=end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
    start_engine # method is called within initialize
  end

  def start_engine # move method into `Vehicle`
    puts 'Ready to go!'
  end
end

class Truck < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year