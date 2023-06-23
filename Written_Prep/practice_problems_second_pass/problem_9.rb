class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")        


# What is output and why? What does this demonstrate about `super`?

=begin
An error is thrown when we try to run the code, specifically an `ArgumentError`.
The `Bear#initialize` method makes a call to `super`, which tells Ruby to search
the method lookup path for a method with the same name and invoke it. Any
argument that is passed into the method that calls `super` will be passed into
the method `super` invokes as well.

In this case, the `Animal#initialize` method, the method that `super` is
attempting to invoke, is expecting no arguments to be passed in, as it is
defined without any parameters. This is why we have an error being thrown, the
the call to `super` is attempting to pass an argument into `Animal#initialize`
when that method does not accept any arguments.

This code snippet demonstrates how `super` works. As previously mentioned,
`super` will search the method lookup path of the class it is called in, and
will search for a method of the same name to invoke. If we don't specify which
(if any) arguments to pass in to the method it invokes, it will by default pass
in the same arguments that are passed into the method that is calling `super`.
=end
