class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")

# What is output and why? What does this demonstrate about `super`? 

=begin
On line 13, a new object is instantiated from the `Bear` class and is
initialized to the local variable `bear`. A string object with the value
`"black"` is passed in as an argument to the `new` method, which passed the
argument into the `Bear#initialize` method. An `ArgumentError` is thrown when we
try to run this code.

The `Bear#initialize` method is defined on lines 7-10. Within the method
definition the keyword `super` is used. `super` tells Ruby to search the `Bear`
class' method look up path for a method with the same name as the method `super`
is used in. `Bear` inherits from the `Animal` class, which also has an
`initialize` method. However, the `Animal#initialize` method does not take an
arguments. When `super` is called within `Bear#intialize`, it forwards the
arguments passed into `Bear#initialize` to the `Animal#initialize` method. This
is why an error is thrown when we attempt to run this code. 

This demonstrates how `super` behaves; it searches the method lookup path of the
class the instance method is in for a method with the same name, invokes it, and
passes in any arguments that were passed in to the method `super` is called in.
=end