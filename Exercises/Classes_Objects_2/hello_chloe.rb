# Hello, Chloe!

# Using the following code, add an instance method named #rename that renames
# kitty when invoked.

=begin
Within this class definition we already have the `attr_accessor` method, so we
know we have a setter and getter method already. While we could just reassign
using `name=`, the exercise asks to define an instance method called `#rename`.
We can define the method, and within the definition we can invoke the setter
method. (Remember, we must prepend the method name with `self`, so Ruby knows
we're invoking the setter method and not initializing a local variable.)
=end



class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    self.name = name
  end
end

kitty = Cat.new('Sophie')
kitty.name
kitty.rename('Chloe')
p kitty.name