# Public Secret

# Using the following code, create a class named Person with an instance
# variable named @secret. Use a setter method to add a value to @secret, then
# use a getter method to print @secret.

=begin
For this exercise, we want to create a class `Person` with an instance variable
named `@secret`. 

We then want to use a setter method to assign a value to that variable and then
we want to use a getter method that we can use to output the data associated
with that variable.

We can achieve 
=end

class Person
  attr_accessor :secret 
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret