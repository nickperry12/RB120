# How is Method Access Control implemented in Ruby? Provide examples of when we
# would use public, protected, and private access modifiers.

=begin
Method access control is implemented through the use of 3 different methods: the
`public` method, the `private` method, and the `protected` method. When a method
is defined in the absence of a `private` or `protected` method call, the methods
are `public` methods (we don't have to invoke the method for them to be made
public) and are readily available to be used by objects of that class.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end
```

The `initialize` method is a public method and is available for use by all
objects instantiated from the class.

When a `private` method is invoked, all methods defined below it will be
unavailable to use anywhere except from within the class (unless a `protected`
or `public` method call is invoked below it).

```ruby
class Person
  def initialize(name)
    @name = name
  end

  private

  attr_reader: name

end
```

The `attr_reader` method is invoked below a `private` method invocation. The
`getter` method created by `attr_reader` is now only available for use within
the class.

When a `protected` method call is invoked, the rules of the `private` method
invocation still apply, but access is now extended to other objects instantiated
from the class as well (again, we may only call these methods from within the
class).

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def compare_names(other)
    name == other.name
  end

  protected

  attr_reader :name
end
```

The `private` method call has been switched to a `protected` method call, so
when we pass in another object into the `compare_names` method, we can all the
`name` getter method on the object without throwing an error.
=end