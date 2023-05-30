class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")


# Do `molly` and `max` have the same states and behaviors in the code above?
# Explain why or why not, and what this demonstrates about objects in Ruby.

=begin
The `molly` and `max` objects will have the same states and behaviors, however,
the data stored within their states will be different. Both objects will have
access to the instance variables `@name` and `@coloring`, but the information
stored within them will be different from one another as well as any other
object instantiatd from the `Cat` class. 

In the context of this example, while `max` and `molly` both have access to the
`@name` and `@coloring` instance variables, `max` will have the string `"Max"`
initialized to `@name` and `"tabby"` initialized to `@coloring`. In contrast,
`molly` will have the string `"Molly"` initialized to `@name` and `"gray"`
initialized to `@coloring`. This demonstrates that objects can be instances of
the same class, but each object will contain different information than the
other objects.
=end
