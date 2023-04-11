# Walk the Cat

# Using the following code, create a module named Walkable that contains a
# method named #walk. This method should print Let's go for a walk! when
# invoked. Include Walkable in Cat and invoke #walk on kitty.

=begin
Modules can be defined in a similar way to classes and method definitions. We
can use the reserved word `module` followed by the module name. We then add in
to the definition what we want that module to do. 

Modules can then be mixed into the class definition using the reserved word
`include`. 
=end


module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sprinkles")
kitty.walk