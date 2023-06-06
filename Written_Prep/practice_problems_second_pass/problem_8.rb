class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno


# What is output and why? What does this demonstrate about `super`?

=begin
When the `bruno` object is passed into the `p` method, the `#inspect` method is
implicitly called on the object. This will return the name of the class the
object is instantiated from, followed by a hexadecimal number that represents
the space in memory it occupies, along with any instance variable that has been
initialized and the value it references. This will be our output:

```
#<GoodDog:0x00007f28d1c851d0 @name="brown", @color="brown">
```

The reason we get this output is due to the way `super` behaves. Within the
constructor method `initialize`, the `super` keywod is called. This tells Ruby
to look up the method lookup path for a method with the same name, and if it
finds one, invoke it. 

The `GoodDog` class inherits from the `Animal` class, where Ruby will find
another `initialize` method. The argument string `"brown"` that is passed into
`GoodDog#initialize` is also passed into `super`. This results in the `@name`
and `@color` instance variables both being initialized to the string `"brown"`.

This demonstrates how `super` works. As previously mentioned, `super` tells Ruby
to search the method lookup path for a method with the same and and invoke it.
Any arguments that are passed into the method that calls `super` will also be
passed into the method that `super` finds and invokes, unless specified
otherwise.
=end