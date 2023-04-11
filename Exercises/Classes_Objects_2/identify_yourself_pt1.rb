# Identify Yourself (Part 1)

# Using the following code, add a method named #identify that returns its
# calling object.

=begin
We can once again use `self` for our solution. Recall that when we use `self`
inside of an instance method, it will reference the calling object. 

When we use `self` outside of an instance method definition, but still within
the class definition, it will reference the class.
=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify