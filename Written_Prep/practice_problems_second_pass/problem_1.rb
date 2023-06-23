class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name


# What is output and why? What does this demonstrate about instance variables
# that differentiates them from local variables?

=begin
The expression `bob.name` on line 10 will output `nil`. This occurs because the
`@name` instance variable has not been initialized. In order to initialize the
variable to the string `"Bob"`, the `#set_name` method needs to be invoked on
the `bob` object, which has not been done. 

This demonstrates that when we try to reference an instance variable that hasn't
been initialized, Ruby will assign it a default value of `nil`. In contrast,
when we attempt to reference a local variable that hasn't been initialized, a
`NoNameError` is thrown. This is why we get the output of `nil`; the `@name`
instance variable is by default will be assigned `nil` if it hasn't been
initialized, and that is what is being returned by the `#name` `getter` method
when it is invoked on the `bob` object.
=end
