# Lecture: Inheritance

# 1. Class based inheritance works great when it's used to model hierarchical
#    domains. Let's take a look at a few practice problems. Suppose we're
#    building a software system for a pet hotel business, so our classes deal
#    with pets.

# Given this class:

# One problem is that we need to keep track of different breeds of dogs, since
# they have slightly different behaviors. For example, bulldogs can't swim, but
# all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to
# return "can't swim!"

=begin
To achieve this we can create a subclass called `Bulldog` that inherits the
behaviors from the `Dog` superclass. 

We can then define an instance method specific to this subclass with the same
name as the `swim` method in the `Dog` superclass. This will override the method
in the superclass (recall that in the method lookup chain, Ruby will check the
class the calling object belongs to first). 
=end

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "I can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# angel = Bulldog.new
# puts angel.speak
# puts angel.swim


# 2. Let's create a few more methods for our `Dog` class.

# Create a new class called `Cat`, which can do everything a dog can, except
# swim or fetch. Assume the methods do the exact same thing. Hint: don't just
# copy and paste all methods in `Dog` into `Cat`; try to come up with some class
# hierarchy.

=begin
We can extract the common behaviors from the `Dog` class and place them in a
superclass called `Animal`. We can then have our subclasses (`Dog`, `Cat`, etc)
inherit those behaviors from the superclass. We can also add behaviors specific
to the subclass into the subclass definition.  Additionally, we can add a speak
method into `Animal` that simply outputs `"(Animal name) says "`, and add a
`speak` method into `Cat` and `Dog` that calls the `super` method and
concatenates the sound the specific object makes.
=end

class Animal
  def initialize(n)
    @name = n
  end

  def speak
    "#{@name} says "
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Animal
  def speak
    super + 'meow!'
  end
end

class Dog < Animal
  def speak
    super + 'arf!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

pupper = Dog.new('Tommy')
kitty = Cat.new('Prinkles')

puts pupper.speak
puts kitty.speak
puts pupper.swim
puts kitty.swim