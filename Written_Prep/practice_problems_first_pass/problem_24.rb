# What are the use cases for `self` in Ruby, and how does `self` change based on
# the scope it is used in? Provide examples.

=begin
`self` will refer to different things depending on where we use it. The use
cases for `self` are when defining a class method, we prefix the method name
with `self` to indicate we are defining a class method.

```
class Person
  def self.im_a_class_method
    puts "hello from inside a class method"
  end
end
```

This would be the equivalent to `def Person.im_a_class_method`.

When `self` is used in a class, but outside of a method definition, it will
refer to the class itself.

```
class Person
  puts self
end
```

If we ran this code, it would output `"Person"`.

When we use `self` inside of an instance method, it refers to the instance
(object) that is calling the method. Using the `Person` class for example, if we
had an `attr_writer` method to create a `setter` method for the instance
variable `@name`, we would use `self` within a method to indicate we are using a
`setter` method:

```
class Person
  attr_accessor :name

  def capitalize_name
    self.name = name.capitalize
  end
end
```

Using `self` in this context tells Ruby we are using the `setter` method instead
of trying to initialize a local variable `name`.
=end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def capitalize_name
    self.name = name.capitalize
  end
end

nick = Person.new("nick")
p nick.name
nick.capitalize_name
p nick.name