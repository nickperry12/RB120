# Choose the Right Method

# Add the appropriate accessor methods to the following code.

class Person
  attr_writer :phone_number
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

=begin
Choosing the accessor method to use depends on what we want to be able to do
with the instance variables and the data associated with them.

In this example, we know that we want to be able to retrieve the name and set
the name. We can determine that the `attr_accessor` method would be the best fit
as it supplies us with both a getter and setter method.

How ever for `phone_number`, we can see that we only need a setter method, and
don't need to retrieve the information. The appropriate method for this would be
`attr_writer` which gives us a setter method, but no getter method.
=end