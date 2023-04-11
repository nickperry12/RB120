# Identify Yourself (Part 2)

# Update the following code so that it prints "I'm Sophie!" when it invokes
# `puts kitty`.

=begin
Our job here is to update the following code, so that when we pass in the object
`kitty` into `puts`, it outputs the following: `"I'm Sophie!"`.

So we know we're not using any sort of instance method here as the object
`kitty` itself is being passed in as an argument to `puts`. And within `puts`
we know that the `to_s` method is called on anything passed in as an argument.

We can define a `to_s` method within our class definition to override the built-
in Ruby method. And within the method we can use string interpolation to add the
instance variable `@name` into the string.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty