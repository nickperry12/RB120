# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end

#   def to_s
#     "My name #{name} and I'm a #{self.class}"
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky


# What is output and why? How could we output a message of our choice instead?

=begin
Line 13 will output the name of the class the `sparky` object is instantiated
from, followed by a hexadecimal ID which represents the space it occupies in
memory. If we wanted modify what is output when we pass in the `sparky` object
into the `puts` method, we would need to define our own `to_s` method and
override the built in `to_s` method provided by Ruby.

When an argument is passed into `puts`, it implicity calls the `to_s` method on
that object. By defining our own `to_s` method, we can change the functionality
and instead have it return a string with the message of our choice like so:

```ruby
class GoodDog
  # rest of code ommitted

  def to_s
    "My name #{name} and I'm a #{self.class}!"
  end
end
```

With our newly defined `to_s` method, when we pass `sparky` into `puts`, it'll now instead
return a string, outputting `"My name is Sparky, and I'm a GoodDog!"`.
=end

# How is the output above different than the output of the code below, and why?

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky

=begin
In this code snippet, the object `sparky` is being passed into the `p` method.
The `p` method implicitly calls the `inspect` method on the argument that is
passed in. The output differs from the snippet above; in additon to outputting
the name of the class the object is instantiated from along with its hexadecimal
ID, it also includes any instance variables that have been initialized as well
as the values assigned to them.
=end
