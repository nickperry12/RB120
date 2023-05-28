# What is the `attr_accessor` method, and why wouldn’t we want to just add
# `attr_accessor` methods for every instance variable in our class? Give an
# example.

=begin
The `attr_accessor` method is a method that accepts a symbol as an argument, and
uses it to create a method name for `getter` and `setter` methods. We wouldn't
to use this for every instance variable in our class because there may be some
data stored within our instance variables that we either don't want exposed to
the public interface via a `getter` method, or we don't want that data to be
modified via the use of a `setter` method. 

For example, we're designing a Pokemon game, and we have a `Pokemon` class with
states like `@name` and `@type`. We want to be able to expose the states, and in
some cases we might even want to modify the name of a Pokemon object. However,
the type of Pokemon shouldn't change, i.e. if it's a "Fire" type of Pokemon,
that should remain consistent throughout the program. So, our class would look
like this:

```
class Pokemon
  attr_reader: :name, :type
  attr_writer: :name

  def initialize(name, type)
    @name = name
    @type = type
  end
end
```

It would make more sense to use an `attr_reader` and `attr_writer` methods here
so we can control which states are able to be modified via a `setter` method,
and which cannot, as opposed to using a `attr_accessor` method to create a
`getter` and `setter` method for all states.
=end
