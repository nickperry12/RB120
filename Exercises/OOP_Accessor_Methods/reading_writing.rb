# Reading and Writing

# Add the appropriate accessor methods to the following code.

=begin
We need an `attr` method that can give us both setter and getter methods.
Instead of using both `attr_reader` and `attr_writer` we can just use
`attr_accessor` which will give us both.
=end

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name