# Describe the distinction between modules and classes.

=begin
In Ruby, we can use both classes and modules as containers to encapsulate
behaviors/methods. The distinction between the two is that we cannot instantiate
objects from a module like we can with classes. Additionally, classes can only
inherit from a single superclass, creating class hierarchies with a parent-child
relationship. In contrast, modules can be mixed into multiple classes; there is
no limit the amount of classes we can mix a module into. When working with
methods that are shared between some subclasses, but wouldn't make sense to have
them inherit from a super class, we can instead mix in the modules into the
subclasses allowing each of them to inherit and share those methods.
=end