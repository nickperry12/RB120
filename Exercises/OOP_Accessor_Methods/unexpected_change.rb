# Unexpected Change

# Modify the following code to accept a string containing a first and last name.
# The name should be split into two instance variables in the setter method,
# then joined in the getter method to form a full name.

=begin
We can define our own setter and getter methods to achieve this, and we can also
get rid of the accessor method `attr_accessor` since we'll be defining both.
Within the setter method, we can assign our instance variables `@first_name` and
`@last_name` to the elements from the returned array from calling `split` on the
given string. 

We also have a ternary operator to handle cases where only a first name is
given. If the `split` method returns an array with a size greater than 1, it
will assign the last element within that array to `@last_name`, and if it isn't
greater than 1, it will assign an empty string.
=end

class Person
  def name=(name)
    @first_name = name.split[0]
    @last_name = name.split.size > 1 ? name.split[-1] : ''
  end

  def name
    @name = "#{@first_name} #{@last_name}".strip
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name