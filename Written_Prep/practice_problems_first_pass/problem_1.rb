# What is output and why? What does this demonstrate about instance variables
# that differentiates them from local variables?

class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name

=begin
On lines 4-10 the class `Person` is defined with two methods. On line 5, the
`attr_reader` method is invoked passing in `:name` as an argument. This creates
a `getter` method for the instance variable `@name`. This would be the same as
defining a method `name` who's sole purpose is to return the value referenced by
`@name`. On line 12, an object of the `Person` class is instantiated and
assigned to the local variable `bob`. On line 13, the getter method
`Person#name` is invoked on `bob` and the return value (the value referenced by
`@name`) is passed into the `p` method. This will output `nil`. 

This code snippet outputs `nil` because we haven't called the `Person#set_name`
method, which initializes `@name` to a string with the value `"Bob"`. This
demonstrates that when we reference an uninitialized instance variable, Ruby
will by default assign that instance variable a value of `nil`. In contrast,
trying to reference a local variable that hasn't been initialized will throw an
error.
=end