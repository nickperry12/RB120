# Generic Greeting (Part 2)

# Using the following code, add two methods: ::generic_greeting and
# #personal_greeting. The first method should be a class method and print a
# greeting that's generic to the class. The second method should be an instance
# method and print a greeting that's custom to the object.

=begin
To define a class method, remember that we need to prepend `self` to the class
method name. 

We can define and instance method using the usual syntax, and have it be more
specific to the object itself.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name} and I'm a cat!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting