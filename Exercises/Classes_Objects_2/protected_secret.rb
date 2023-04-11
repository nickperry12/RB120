# Protected Secret

# Using the following code, add an instance method named compare_secret that
# compares the value of @secret from person1 with the value of @secret from
# person2.

=begin
In this exercise, we're using the `protected` method with the getter and setter
methods for `secret` below the method call. The difference between the
`private` and `protected` method calls are `protected` are still available
between class instances, whereas private methods are not.

Knowing this, we can access the getter method for `secret` to use within the
`compare_secret` method definition.

We can see in this code that we're passing in an argument to `compare_secret`,
so how can we pass in the secret referenced by `person2`?

We can pass in the object itself as an argument, in this case that argument
would be `person2`. Within the definition we can make the comparison: is the
data referenced by the instance method `secret` the same as the data referenced
by calling the instance method `secret` on the object being passed in?

The `secret` instance method to the left will reference the instance variable
`@secret` for the object that is calling the `compare_secret` method. On the
right hand side of `==`, the instance method `secret` is being called on the
object being passed into the `compare_secret` method.
=end

class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)