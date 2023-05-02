# Guaranteed Formatting

# Using the following code, add the appropriate accessor methods so that @name
# is capitalized upon assignment.

=begin
We'll need the access method `attr_reader` to give us a getter method, so we can
reference `@name` inside and outside of the class. We'll also need a setter
method, and while we could use the accessor method `attr_writer`, we need to be
able to call the `#capitalize` method on the name, so it makes more sense that
we define the setter method ourselves. 

Recall that the syntax for a setter method is `state=(s)`, where state is the
instance variable or 'state' that we're setting. This could be the name, weight,
height, etc. Within the method, we can assign the instance variable `@name` to
the passed in argument `name` (this will reference the getter method), and then
call the `capitalize` method on the getter methods return value.
=end

class Person
  attr_reader :name

  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name # => Elizabeth