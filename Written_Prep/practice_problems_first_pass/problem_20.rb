# What is the difference between states and behaviors?

=begin
States refer to the data associated with an individual object. This data is
stored within the object's instance variables. For example, we have a `Dog`
class, we could have instance variables such as `@name`, `@weight`, `@height`
that keep track of the individuals objects name, weight and height. These
variables are scoped at the instance level.

Behaviors refer to the behaviors of the objects, and were defined within the
class and are made available to instances (objects) of that class. Behaviors are
what these objects are capable of doing. Using the previous example, an object
of the `Dog` class is able to jump, fetch, run and/or play. Instance methods,
which are also scoped at the instance level, expose these behaviors.
=end