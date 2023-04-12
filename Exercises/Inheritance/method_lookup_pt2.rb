# Method Lookup (Part 2)

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes and modules that Ruby will check when
# searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

=begin
We have a superclass `Animal` that subclasses `Cat` and `Bird` inherit their
behaviors from. The superclass `Animal` doesn't contain a `color` method, nor
does the subclass `Cat`.

Ruby will first look within `Cat`, then `Animal`, followed by the built in
classes of Ruby until there are no more classes to look in.

Cat => Animal => Object => Kernel => BasicObject
=end