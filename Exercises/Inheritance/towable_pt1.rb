# Towable (Part 1)

# Using the following code, create a Towable module that contains a method named
# tow that prints I can tow a trailer! when invoked. Include the module in the
# Truck class.

=begin
We define modules in a similar way to class, using the reserved words `module`
followed by the name (using CamelCase), the definition and then the reserved
word `end`.

To mixin the module within a class, we can use the reserved word `include`.
=end

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow