# Question 2

# Building on the prior vehicles question, we now must also track a basic
# motorboat. A motorboat has a single propeller and hull, but otherwise behaves
# similar to a catamaran. Therefore, creators of Motorboat instances don't need
# to specify number of hulls or propellers. How would you modify the vehicles
# code to incorporate a new Motorboat class?

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Seacraft
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # only 1 hull and propeller, so we can pass that in as an argument
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end


=begin
We created two new classes: `Motorboat` and `Seacraft`. Both `Motorboat` and
`Catamaran` both inherit behaviors from `Seacraft`. Since they both subclass
from `Seacraft`, we can move the `initialize` method into `Seacraft` as the
parameters for both classes will be the same. We can also mix in `Moveable`
into the `Seacraft` class for both subclasses to inherit, as well as the
`attr_reader` method with it's arguments.

Within the `Motorboat` class, we can override `initialize` and call `super` from
within the method definition, and pass in `1` as an argumen for both `num_hulls`
and `num_propellers` since we know that each one will only contain 1.

The `Catamaran` class ends up being empty as it inherits all its behaviors from
the `Seacraft` superclass.
=end