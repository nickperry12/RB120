# Avoid Mutation

# The following code is flawed. It currently allows @name to be modified from
# outside the method via a destructive method call. Fix the code so that it
# returns a copy of @name instead of a reference to it.

=begin
We want to disallow the `@name` instance variable from being mutated with
mutating method calls outside of the class. We want the code to instead return
a copy of `@name` instead of a direct refernce to it. If we use `private` or
`protected` method calls, an error will be thrown when we try to call reverse on
`name`.

We can instead remove the accessor method `attr_reader` and create our own
getter method, and have this getter method return a shallow copy of `@name`
instead of returning the variable itself. 

def name
  @name.dup
end

=end

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.dup
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name # => James