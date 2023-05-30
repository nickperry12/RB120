module Drivable
  def self.drive
    puts "driving"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.class.drive


# What is output and why? What does this demonstrate about how methods need to
# be defined in modules, and why?

=begin
This code snippet will throw a `NoMethodError` when we attempt to call the
`#drive` method on the `bobs_car` object. This is because we're attempting to
call an instance method `drive` on the `bobs_car` object that is instantiated
from the `Car` class.

The `Car` class has the `Driveable` module mixed in, which has the class method
`::drive` defined within it. The method name has `self` prefixed to it, and when
we have `self` prefixed to a method name, we're defining a class method. Class
methods can only be called on the class itself, not objects instantiated from
it.

Additionally, we can't define class methods within a module because we cannot
instantiate objects from a module. When defining methods within a module, we
must do so without the use of `self` in order for the methods to be called on
objects.
=end
