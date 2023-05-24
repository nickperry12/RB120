module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  def hi
    puts "hi"
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
good_dog.hi

# What is the method lookup path used when invoking `#walk` on `good_dog`?

=begin
On line 44 the local variable `good_dog` is initialized to the instantiation of
an object from the `GoodAnimals::GoodDog` class. When we call `walk` on
`good_dog`, Ruby will first check within the `GoodAnimals::GoodDog` class, where
the method will not be found. Ruby will then search the `GoodAnimals::GoodDog`
method look up path. The `GoodAnimals::GoodDog` class has 2 modules mixed in,
`Swimmable` and `Danceable`, and also subclasses from the `Animal` superclass.

The `GoodAnimals::GoodDog` class is defined within the `GoodAnimals` module,
which has the `Climbable` module mixed into it. As a result of all this, the
method look up path for the `GoodAnimals::GoodDog` class will be:

`[GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel,
BasicObject]`

This can be seen by running the following code:

`p good_dog.class.ancestors`

This returns an array containing the method lookup path for the
`GoodAnimals::GoodDog` class.
=end
