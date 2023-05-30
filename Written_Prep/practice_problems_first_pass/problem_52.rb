class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


# In the `make_one_year_older` method we have used `self`. What is another way
# we could write this method so we don't have to use the `self` prefix? Which
# use case would be preferred according to best practices in Ruby, and why?

=begin
If we wanted to rewrite this method without the use of `self`, we could do the
following:

```
def make_one_year_older
  @age += 1
end
```

The difference here is that instead of calling the `setter` method age with the
use of `self`, we're accessing the instance variable directly and reassigning it
to `@age + 1`.

Because we have a `attr_accessor` method invoked, with `:type` and `:age` passed
in as arguments, we now have a `setter` and `getter` method available for both
of these instance variables. According to Ruby style guides, if a `setter` or
`getter` method available, we should use those to access the instance variable
instead of doing so directly.

Their are various reasons for preferring to use a `setter` method. By using a
`setter` method, we're encapsulating access to the instance variable, which
maintains one of the core concepts of OOP. We can now control how the instance
variables are accessed and modified.

By using a `setter` method, we have more flexibility with our code. We can add
more functionality to our `setter` methods - we add data validation and
manipulation, and can do so without affecting other parts of the code that use
the class.

It also provides a layer of abstraction that separates the implementation
details from the public interface. We're creating a more intuitive and
descriptive interface for other code to interact with our class.
=end
