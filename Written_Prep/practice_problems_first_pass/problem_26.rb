# How do class inheritance and mixing in modules affect instance variable scope?
# Give an example.


=begin
When a class inherits from a superclass, it not only inherits the methods
available to the class, but the instance variables are available as well. The
same applies to interface inheritance (mixing in modules), when a module is
mixed into a class, both the methods defined and instance variables available
are now able available to the class the module is mixed into. Consider the
following example:

```ruby
module Flyable
  attr_reader :fly_state

  def enable_flying
    @fly_state = "flying"
  end
end

class Animal
  attr_reader :animal

  def initialize(animal)
    @animal = animal
  end
end

class Bird < Animal
  include Flyable
end

duck = Bird.new("duck")
duck.enable_flying
p duck.fly_state
p duck.animal
```

We have a class `Bird` that inherits from the `Animal` class via class
inheritance, as well as inherits from the `Flyable` module via interface
inheritance. Not only are we able to call the methods defined in the superclass
and mixed in module, the instance variables within them are made available to
`Bird` as well.
=end

module Flyable
  attr_reader :fly_state

  def enable_flying
    @fly_state = "flying"
  end
end

class Animal
  attr_reader :animal

  def initialize(animal)
    @animal = animal
  end
end

class Bird < Animal
  include Flyable
end

duck = Bird.new("duck")
duck.enable_flying
p duck.fly_state
p duck.animal
