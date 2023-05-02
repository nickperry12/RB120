# Who is Older?

# Using the following code, add the appropriate accessor methods. Keep in mind
# that @age should only be visible to instances of Person.

=begin
We need to add the appropriate accessor methods. We can see that we need an
`attr_writer` method to be able to get a setter method so we can set the age. We
can also see from the problem description that the `@age` variable only needs to
be accesible between instances of the `Person` class. This tells us that we need
to place an `attr_reader` method below a `protected` method call. Remember, with
the `protected` method call, any methods below it will be available between
instances of the class, but will not be available outside of the class.
=end

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)