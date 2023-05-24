class Animal
  def eat
    puts "I eat."
  end
end

class Fish
  def eat
    puts "I eat plankton."
  end
end

class Dog
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end


# What is output and why? How does this code demonstrate polymorphism? 

=begin
On line 23, the local variable `array_of_animals` is initialized to an array
containing an object instantiated from 3 different classes - the `Animal`,
`Fish` and `Dog` classes. The `Fish` and `Dog` classes both inherit from the
superclass `Animal`, which allows the `Fish` and `Dog` classes to have access to
the methods defined within the `Animal` class. However, both the `Fish` and
`Dog` classes define their own `eat` method, overriding the `Animal#eat` method
they inherit.

On line 24, the `each` method is called on `array_of_animals`, passing in a
`do..end` block with a single parameter, `animal`. Within the block, the
`feed_animal` method is called, passing in the current object on iteration into
it as an argument. The `feed_animal` method is defined on lines 19-20, and calls
the `eat` method on the object passed in.

This code snippet will output:

"I eat." "I eat plankton." "I eat kibble."

This demonstates two things about polymorphism. It demonstrates polymorphism
through inheritance, as both the `Fish` and `Dog` classes subclass from the
superclass `Animal` providing them access to the `Animal#eat` method. However,
because the subclasses define their own `eat` method, this could be seen as
polymorphism through ducktyping, as all classes can respond to a method call
with the same name and that takes the same number of arguments. If we were to
make it so that the `Dog` and `Fish` no longer subclassed from `Animal`, this
code snippet would still work, because, as previously mentioned, all classes
have their own `eat` method defined, that takes the same number of arguments.
=end