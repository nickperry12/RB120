class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"

# What does the above code demonstrate about how instance variables are scoped?

=begin
This code demonstrates that instance variables are scoped at the object level,
so even if they are initialized within another instance method, they will still
be accessible from inside another instance method. In this code snippet, the
instance variable `@name` is initialized within the constructor method
`initialize`, and we are able to access it within the `get_name` instance
method.
=end
