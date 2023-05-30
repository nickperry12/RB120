class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new

p paws == whiskers

# If we use `==` to compare the individual `Cat` objects in the code above, will
# the return value be `true`? Why or why not? What does this demonstrate about
# classes and objects in Ruby, as well as the `==` method?

=begin
No, it would return `false`. When we use the `==` method to compare two objects,
it's checking to see if the object is the same as the other; i.e it's checking
to see if it's the same object that occupies the same space in memory. This
demonstrates that when we instantiate objects of different classes, they are
different objects, occupying different spaces in memory, with different data
stored in their states. It also demonstrates that the `==` method, at the object
level, will return `true` if the the caller and the reciever are the same object
and not just objects of the same class. This method is usually overriden within
the Ruby subclasses in order to specify what to compare between objects.
=end
