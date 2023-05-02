# What's the Output?

# Take a look at the following code:

# What output does this code print? Fix this class so that there are no
# surprises waiting in store for the unsuspecting developer.
=begin

=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code "works" because of that mysterious to_s call in Pet#initialize.
# However, that doesn't explain why this code produces the result it does. Can
# you?

=begin
On line 1 we're initializing the local variable `name` to the integer `42 `.
We're then instantiating a new object `fluffy` from the class `Pet ` on line 2,
with `name` being passed in as an argument. Within the `initialize ` instance
method, `name` has the `#to_s` method called on it. When `#to_s` is called on
an integer object, its returning the string representation of the integer. At
this point, `name` and `@name` are no longer referencing the same object. 

Even if `#to_s` mutated the caller, the output would not change as integers are
immutable. So, on line 3 where we see `name += 1`, what is happening is `name `
is being reassigned to the return value of the current value referenced by
`name` + 1. `@name` and `name` would still be referencing different objects.
=end