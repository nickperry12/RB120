# When should we use class inheritance vs. interface inheritance?

=begin
There are a few things we need to consider when choosing between class
inheritance or interface inheritance. Firstly, we must consider that a class can
only subclass from one superclass, whereas with interface inheritance we can mix
in modules to any amount of classes. Second, if there is an "is-a" relationship
between two classes, e.g a dog "is-a" animal, then class inheritance would make
sense as we have a natural hierarchy between the two classes. With interface
inheritance, there's a "has-a" relationship; a dog "has-a" ability to bark,
while not all other animals do; mixing in a module with these behaviors would
now make the most sense to use. Lastly, we must consider that object are
instantiated from classes, but we cannot instantiate them from modules.
=end