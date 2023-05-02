# Complete the Program - Cats!

# Consider the following program. Update this code so that when you run it, you
# see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further Exploration

# An alternative approach to this problem would be to modify the Pet class to
# accept a colors parameter. If we did this, we wouldn't need to supply an
# initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good idea to
# modify Pet in this way? Why or why not? How might you deal with some of the
# problems, if any, that might arise from modifying Pet?

=begin
Question 1:

We would be able to omit the `initialize` method because the `Cat` class would
be inheriting the method from the superclass `Pet`. 

Question 2 & 3:

Whether this is a good idea or not would depend on the context. For this problem
specifically I think it would be fine, as we're dealing with a subclass `Cat`
that does have fur. However, if we were to add more subclasses of pets that
didn't have fur (e.g., we add a `Bird` and `Snake` class), then this route would
no longer make sense as we now have subclasses of the `Pet` class that require a
fur color attribute when they don't have fur. In this case it might make more
sense to use module. Another solution to that would be to set a default value
for the `@color` instance variable; we could set it to an empty string
`@color = ''` or have it set to `nil`, `@color = nil`.
=end