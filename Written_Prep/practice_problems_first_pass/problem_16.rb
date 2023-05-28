# Why is it generally safer to invoke a setter method (if available) vs.
# referencing the instance variable directly when trying to set an instance
# variable within the class? Give an example.

=begin
It is generally safer to use a setter method when available because it serves as
a form of data protection, i.e.,  we cannot manipulate the data stored in an
instance variable without obvious intention. This coincides with one of the core
principles of OOP, which is encapsulation. We are taking pieces of functionality
and hiding it away from the rest of the code base, protecting it from being
altered by mistake. For example we have a `Person` class with an instance
variable `@name`:

```
class Person
  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end
end
```

Here we are defining a `setter` method and encapsulating it within the `Person`
class. Upon instantiation of an object, we can pass an argument into the
constructor method, initializing the instance variable `@name` to the argument
passed in. If for some reason we wanted to change the name state of this object
at any point in the program, we can only do so with obvious intention and
calling the `setter` method `name` on the object.
=end