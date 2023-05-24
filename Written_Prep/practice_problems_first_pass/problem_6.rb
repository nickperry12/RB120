class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise
# an error. Why? How could we adjust this code to output `'BOB'`? 

=begin
The `change_name` method is defined within the `Person` class definition on
lines 8-11. Within the definition we have the code:

`name = name.upcase`

When Ruby parses this line, it sees that the local variable `name` will be
initialized, so it initializes it to `nil` in preparation. On the right side of
the `=` operator, the `upcase` method is called on `name`. Because `name` has
been initialized to `nil`, a `NoMethodError` is thrown as there is no `upcase`
method for the `NilClass`. 

To adjust this code to get our desired output, we can prefix `name` with `self`.
The code would look like this:

`self.name = name.upcase`

Ruby will then see we're using a `setter` method, and passing in the return
value of calling `upcase` on the value referenced by the `getter` method `name`.
=end
