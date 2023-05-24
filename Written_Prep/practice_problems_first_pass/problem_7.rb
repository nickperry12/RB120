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
On line 9, the `p` method is invoked, passing in the return value of calling the
`::wheels` method on the `Vehicle` class. The `Vehicle::wheels` method is
defined on lines 4 - 6, and returns the class variabe `@@wheels` which is
initialized within the `Vehicle` class on line 2 to the integer value 4. Line 9
will output 4.

On line 15, the `p` method is invoked, this time passing in the return value of
the `::wheels` method being called on the `Motorcycle` class, which subclasses
from `Vehicle`, giving the `Motorcycle` class access to all methods and
variables initialized within the `Vehicle` class. On line 12 within the
`Motorcycle` class, `@@wheels` is reassigned to the integer value 2. Line 15
will output 2.

On line 20, `::wheels` is called on the `Vehicle` class again, with the return
value being passed into the `p` method. Line 20 will output 2. On line 21, the
return value of calling `::wheels` on the `Motorcycle` class is passed into the
`p` method, outputting 2. On line 22, `::wheels` is called on the `Car` class,
which is defined on line 18. The `Car` class also subclasses from `Vehicle`.
Line 22 will output 2.

This demonstrates that class variables are shared between superclasses and their
subclasses. When `@@wheels` is reassigned to 2 on line 12, it is reflected when
each class calls the `::wheels` method. When workin with inheritance, it's a
good idea to avoid using class variables for this reason, otherwise we may get
unwanted bugs and behaviors within our program when reassigning the class
variable in a different class.
=end
