class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.each { |pet| pet.jump }


# We raise an error in the code above. Why? What do `kitty` and `bud` represent
# in relation to our `Person` object?

=begin
On line 22 a new object is instantiated from the `Cat` class and is assigned to
the local variable `kitty`. On line 23 another object is instantiated, this time
from the `Dog` class, and is asigned to the local variable `bud`. On lines 26
and 27, both objects are pushed into an array referenced by `Person#pets`. When
objects are stored as a state within another object, they are called
collaborator objects because they work in collaboration with the class they are
associated with.

A `NoMethodError` is thrown here because we are attempting to call the
`Pet#jump` method on the return value of `bob.pets`. `bob.pets` returns an array
object, which does not have a defined `jump` method. To make this work, we can
instead call `each` on `bob.pets`, and within the block, call `jump` on the
current object passed into the block on each iteration:

`bob.pets.each { |pet| pet.jump }`
=end
