module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 


# What is output and why? What does this demonstrate about constant scope? What
# does `self` refer to in each of the 3 methods above? 

=begin
On line 25, the expression `Square.sides` will output `4`. When the class method
`::sides` is called on `Square`, it is returning the value of the constant
variable `SIDES`. When trying to resolve the `SIDES` constant, Ruby will first
search lexically, checking the referencing container first. When it doesn't find
it there, it will search up the inheritance chain, and find `SIDES` within the
`Quadrilateral` class, where it is initialized to `4`.

On line 26, a new object is instantiated from the `Square` class and the
instance method `#sides` is invoked on the object. `#sides` is defined within
the `Shape` class, where it tells Ruby to search the calling object's class for
`SIDES`; it tells Ruby this with the use of the constant resolution operator
`::`. Ruby will first check the `Square` class, where it is not found. It will
then search the inheritance chain of the container Ruby directed it to and will
once again find it in `Quadrilateral`, outputting `4`.

On line 27, `Square.new.describe_shape` will throw an error. `describe_shape` is
defined within the `Describable` module, and returns a string that uses
interpolation to interpolate `self.class` and `SIDES` within the string. When
Ruby tries to resolve `SIDES` within the string, it will first search lexically,
searching the `Describable` module. It will not find it there, and will then
search the inheritance chain, and if it doesn't find it there will search the
main scope. However, modules don't inherit from anything, so it will search the
main scope where it will not be found, resulting in a `NoNameError`. 

This code snippet demonstrates that constant variables have lexical scope. When
Ruby tries to resolve a constant without the use of a constant resolution
operator, it will first search lexically, i.e it will search the referencing
container. If it doesn't find it there, it will look through the inheritance
chain of the referencing class or module. And if it isn't found there, it will
search the main scope/top level.

If Ruby tries to resolve a constant with the use of a constant resolution
operator, Ruby will search the container the operator directs it to. If it isn't
found there, it will look up the inheritance chain of the class/module the
operator directed it to. If it doesn't find it there, an error is thrown. The
difference here is that when resolving a constant with the use of a constant
resolution operator, Ruby will not check the main scope after searching the
inheritance chain.
=end
