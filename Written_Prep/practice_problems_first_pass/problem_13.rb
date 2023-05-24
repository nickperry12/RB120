class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name   


# What is output and why?

=begin
On line 16, a new object is instantiated from the `Dog` class and is assigned to
the local variable `teddy`. A string with the value `"Teddy"` is passed into
`new`, which passes it into the constructor method `initialize` which gets
invoked upon instantiation of a new object. Howver, within the `Dog#initialize`
method, nothing is done with the argument. This is why when we invoke
`Dog#dog_name` on line 16, and pass the return value to `puts` we have an output
of `"bark! bark!  bark! bark!"`. 

Within the `Dog#dog_name` method definitions on lines 10-12, we have the
following string that uses string interpolation to insert the value refernced by
`@name` into it:

`"bark! bark! #{@name} bark! bark!"`

But because `@name` is never initialized, Ruby assigns it a default value of
`nil`, which will return an empty string when we try to interpolate it. The
`Dog#initialize` method overrides the `Animal#initialize` method it inherits by
subclassing from the `Animal` superclass. As a result of overriding the method,
and as previously mentioned the `Dog#initialize` method doing nothing with the
argument passed in, `@name` never gets initialized and will have the default
value of `nil`.
=end