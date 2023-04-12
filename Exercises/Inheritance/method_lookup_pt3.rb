# Method Lookup (Part 3)

# Using the following code, determine the lookup path used when invoking
# bird1.color. Only list the classes or modules that were checked by Ruby when
# searching for the #color method.

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
puts bird1.class.ancestors

=begin
We have a module `Flyable`, and the following classes `Animal`, `Cat` and `Bird`
with `Animal` being the superclass `Cat` and `Bird` inherit from. The `Flyable`
module is also mixed in to `Bird`. The method `color` is located within the
`Animal` superclass. Ruby will check the following before finding it:

Bird => Flyable => Animal

It checks the module `Flyable` before checking the `Animal` superclass.
=end