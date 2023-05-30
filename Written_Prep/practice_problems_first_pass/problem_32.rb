# What is polymorphism and how can we implement polymorphism in Ruby? Provide
# examples.

=begin
Polymorphism is the ability for different objects to respond to the same method
call. In Ruby, polymorphism is achieved through class inheritance, interface
inheritance and ducktyping. With class inheritance, subclasses inherit behaviors
and states from a superclass, creating a class hierarchy with a parent-child
relationship which can be seen in the following example:

```ruby
class Hero
  def initialize(name)
    @name = name
  end
end

class Warrior < Hero; end
```

The `Warrior` class inherits from the `Hero` class, inheriting the `initialize`
method as well as the `@name` instance variable. Anything defined or initialized
within the `Hero` class will be made available to any class that inherits from
it.

Interface inheritance is accomplished by mixing modules into classes using the
`include` method invocation. Similar to class inheritance, any behaviors/states
within the module will be made available to the class it is mixed into. Where it
differs is that we can mix in a module into as many classes as we want, whereas
we can only inherit from a single superclass.

```ruby
module Swingable
  def swing_sword
    "swings sword!"
  end
end

class Warrior < Hero
  include Swingable
end

class Paladin < Hero
  include Swingable
end
```

Ducktyping refers to objects of unrelated types responding to the same method
call. There isn't any concern with the class or object type, only to whether
they have a particular behavior: "if it quacks like a duck, treat it like a
duck". For it to be ducktyping, there needs to be intention behind it, otherwise
it's coincidental that two objects respond to the same method call. An example
of ducktyping:

```ruby
class Plane
  def flying
    "Flying through the sky"
  end
end

class Bird
  def flying
    "This bird is flying"
  end
end

[Plane.new, Bird.new].each { |obj| puts obj.flying }
```

Here there are two unrelated objects, a `Plane` object and a `Bird` object,
placed into an array. The `each` method is called on the array with a block. 
On each iteration the `flying` method is called on the object.
=end