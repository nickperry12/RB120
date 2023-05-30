module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
p pingu.class.ancestors


# What is the method lookup path that Ruby will use as a result of the call to
# the `fly` method? Explain how we can verify this.

=begin
When we call the `Flight::fly` method on the `pingu` object, Ruby will first
lookin within the `Penguin` class for the `fly` method, where it will not find
it. Next, it will check the modules that have been mixed into the `Penguin`
class - `Migratory` and `Aquatic`, in that order. When Ruby doesn't find the
method in either of those modules, it will then check the `Bird` superclass. The
`fly` method will not be found there, and Ruby will then check within the
`Animal` class that `Bird` subclasses from, where it will once again not find
the `fly` method.

After checking the `Bird` and `Animal` classes, Ruby will search further up the
method lookup path in the built in Ruby classes and modules. It will check the
`Object` class, the `Kernel` module, and lastly the `BasicObject` class. It will
not find the method in any of these classes or modules, and the result is an
error being thrown.

To verify the lookup path, we can first call the `class` method on the `pingu`
object, returning the class it's instantiated from, and then call the
`ancestors` method on that return value. This will return an array containing
the classes and modules that are apart of the calling classes method lookup
path.
=end
