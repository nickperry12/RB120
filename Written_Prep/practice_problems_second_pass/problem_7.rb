class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels     


# What does the code above output, and why? What does this demonstrate about
# class variables, and why we should avoid using class variables when working
# with inheritance?

=begin
In this code snippet we have 6 different calls to the `::wheels` method. On line
9, `Vehicle.wheels` will output `4`. On line 15 and 16, `Motorcycle.wheels` and
`Vehicle.wheels` will output `2`. On lines 20, 21, and 22, `Vehicle.wheels`,
`Motorcycle.wheels` and `Car.wheels` will all output `2`.

When `Vehicle.wheels` is called on line 9, the class variable `@@wheels` will
reference the integer `4`. On lines 11-13, the `Motorcycle` class is defined,
which inherits from the `Vehicle` class. The class variable `@@wheels` is
reassigned to `2` within the class definition.

The `Car` class is defined on line 18, which also inherits from the `Vehicle`
superclass. `@@wheels` at this point still references the integer 2.

This code snippet demonstrates that class variables are scoped at the class
level, and are shared between a superclass and all of it's subclasses. This is
why when `@@wheels` is reassigned within the `Motorcycle` class, we have an
output of `2` when invoking the `::wheels` method on the `Vehicle` and `Car`
classes.

For this reason, when working with inheritance it's a good idea to avoid using
class variables. If we reassign a class variable within a subclass that it
inherits from it's superclass, it will be reflected in all classes that inherit
from the superclass. This can lead to unwanted behaviors and bugs in our code.

=end
