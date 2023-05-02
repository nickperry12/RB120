# Prefix the Name

# Using the following code, add the appropriate accessor methods so that @name
# is returned with the added prefix 'Mr.'.

=begin
We need an accessor method that allows us to view the name outside of the class.
The appropriate method here for this would be the `attr_reader` accessor method.
We also want to prepend `"Mr. "` to the name that is being assigned to `@name`.
Similar to the previous problem, we can create our own setter method that
assigns `@name` to return value of calling `prepend` on `name`, and passing in
`"Mr. "` as an argument.
=end

class Person
  attr_reader :name

  def name=(name)
    @name = name.prepend("Mr. ")
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name # => Mr. James