# What is the difference between instance methods and class methods?

=begin
Instance methods are scoped at the instance level and are available to be
invoked on instances (objects) of a class. In order to call them, we'd need to
instantiate an object from a class, and then call the methods on that object.

Example:
```
class Jedi
  def self.jedi_order
    "This is the Jedi order"
  end

  def swing
    "swings lightsaber"
  end
end

obiwan = Jedi.new
obiwan.swing
Jedi.jedi_order
```

Within this class, we have an instance method `#jedi` which can be called on
objects instantiated from the `Jedi` class. We also have a class method
`::jedi_order`. Class methods are scoped at the class level, and are called on
the class itself. Class methods have `self` prefixed to the method name, and are
used when we're dealing with functionality that doesn't pertain to individual
objects.
=end