class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno

# What is output and why? What does this demonstrate about `super`?

=begin
On line 16, a new objected is instantiated from the `GoodDog` class, with the
string `"brown"` passed in as an argument into the `new` method, which then gets
passed into the `initialize` constructor method. The new object is initialized
to the local variable `bruno`. `bruno` is then passed into the `p` method on
line 17, which will output the class name `GoodDog`, followed by a hexadecial ID
that represents its location in memory, and any instance variables that have
been initialized with their corresponding values - `@name = "brown"` and `@color
= "brown"`.

When the keyword `super` is used within the `GoodDog` `initialize` method, it
tells Ruby to search the method lookup path for a method with the same name and
invoke it. Additionally, any arguments passed into `GoodDog#initailize` will be
forwarded to the the `initialize` method that is found in the method look up
path. Because `GoodDog` inherits from the `Animal` class, `Animal` will be apart
of its method look up path, where the another `intialize` method will be found.
`Animal#initialize` is invoked from within `GoodDog#initialize`, with the
argument `"brown"` passed into it as an argument. The instance variables `@name`
and `@color` are then initialized to the string `"brown"`. 

This demonstrates that any arguments passed into a method that contains the
keyword `super`, will be forwarded to the method Ruby finds further up the
method look up path.
=end