# Comparing Names

# Using the following code, add the appropriate accessor methods. Keep in mind
# that the last_name getter shouldn't be visible outside the class, while the
# first_name getter should be visible outside the class.

=begin
We need setter methods for both `first_name` and `last_name`. We also need
getter methods for both, however, the getter method for `last_name` shouldn't be
visible outside of the class, while the getter method for `first_name` should be
visible outside of the class.

We can use the `attr_accessor` method for `first_name` as we want getter and
setter methods. We can then use a public `attr_writer` method for `last_name` so
we can use the setter method outside of the class.

Now, because we want the `last_name` getter method to be unavailabe outside of
the class, we need to invoke the `private` method, and place th `attr_reader`
method below it. This makes it so that getter method for `last_name` is
available within the class, but not outside of it.

Remember private methods are only available within the class itself, and are
only accessible within the class when called without `self`. 
=end

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last? # should output false