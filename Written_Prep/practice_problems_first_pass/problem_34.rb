module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk


# What is returned/output in the code? Why did it make more sense to use a
# module as a mixin vs. defining a parent class and using class inheritance?

=begin
Line 40 will output the string `"Mike strolls forward"` when the
`Walkable::walk` method is invoked on the `mike` object, and will return `nil`.
Line 42 will output the string `"Kitty saunters foward"`, and will return `nil`.
In this example it makes more sense to use interace inheritance over class
inheritance because while both objects have an ability to walk, it would not
make sense for a `Person` and `Cat` object to inherit from the same superclass,
as the objects themselves are not related to one another.

When deciding whether to use class inheritance vs interface inheritance, we must
look at the relationship between the objects. Typically, if there's a "is-a"
relationship, e.g a child is a person, then we would use class inheritance. 

When there's a "has-a" relationship, like this example, where `Person` object
"has-a" ability to walk, and a `Cat` object also "has-a" ability to walk, using
interface inheritance would be more appropriate.
=end
