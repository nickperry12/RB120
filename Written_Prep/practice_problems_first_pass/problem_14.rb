class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true


# In the code above, we want to compare whether the two objects have the same
# name. `Line 11` currently returns `false`. How could we return `true` on `line
# 11`? 

# Further, since `al.name == alex.name` returns `true`, does this mean the
# `String` objects referenced by `al` and `alex`'s `@name` instance variables
# are the same object? How could we prove our case?

=begin
In the code's current state, when we invoke `==` on the object refernced the
local variable `al`, passing in the object referenced by local variable `alex`
as an argument, it will be checking to see if the two objects are the same. This
is why it's returning false, even though the two objects are instantiated from
the same class, they are not the same. They will both occupy different spaces in
memory, with different values for their initialized instance variable `@name`. 

To remedy this and get the `==` method to compare their `@name` values instead,
we can define `==` method within the `Person` class, and override the built in
`==` Ruby method. The code for that would look like this

```ruby
def ==(other_object)
  name == other_object.name
end
```

`name` to the left of `==` is the invocation of the `name` getter method,
returning the value referenced by the calling objects instance variable `@name`.
A different object is passed into the method as an argument, and on the left
side of `==`, the object has the `getter` method `name` called on it. This
allows us to compare the values refernced by `name` for both objects.

While both `al` and `alex` will have the same name, the string objects that are
referenced by `Person#name` are not the same, they only have the same value. To
show this we can run the following code:

```ruby
p al.name.object_id # => 60
p alex.name.object_id # => 80
```

With this, we can see that both object occupy a different space in memory.
=end
