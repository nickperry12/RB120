class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name


# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise
# an error. Why? How could we adjust this code to output `'BOB'`? 

=begin
When we try to run this code, line 15 throws a `NoMethodError`, stating that
there is an undefined method `upcase` for `nil`:`NilClass`. This occurs due to
the syntax within the `#change_name` method. When Ruby sees the expression `name
= name.upcase`, it parses the entire line and initializes `name` to `nil` in
preparation to invoke `upcase` on `name`. You cannot invoke `upcase` on `nil`
and this is why we get the error that we do.

In order to remedy this, we need to prefix `self` to `name`, so the expression
looks like this `self.name = name.upcase`. `self` used in this context will
reference the calling object as it's being used in an instance method that is
scoped at the object level. It then calls `upcase` on `name`, which now reads as
`upcase` being called on the `getter` method `name`, which is referencing the
value assigned to the instance variable `@name`. This would give us the the
desired output of `"BOB"` on line 16.

Additionally, we can also access the instance variable directl and change the
expression to `@name = @name.upcase`. However, Ruby convention suggests that
it's better to use `setter` and `getter` methods when available instead of
accesing the instance variables directly. In this code we have `setter` and
`getter` methods available due to the `attr_accessor` method call on line 2.
=end
