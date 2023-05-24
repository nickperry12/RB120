module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 

# What is output and why? What does this demonstrate about constant scope? What
# does `self` refer to in each of the 3 methods above? 

=begin
The `Square` class is defined on line 23, subclassing from the `Quadrilateral`
class, which is defined on lines 19-21, inheriting from the `Shape` class, and
initialize the constant variable `SIDES` to the integer 4 on line 20. The
`Shape` class is defined on lines 7 - 17, which mixes in the `Describable`
module, and defines one class method `self.sides` and one instance method
`#sides`. `Square` subclasses from `Quadrilateral`, which subclasses from
`Shape`, which mixes in `Describable`. All methods within `Describable` are
available to `Shape`, and all methods available to `Shape` will be available to
the `Quadrilateral` and `Square` subclasses.

On line 25, the `p` method is invoked, passing in the return value of calling
the class method `Shape::sides` on the class `Square`. `Shape::sides` is defined
on lines 10-12 within the `Shape` class definition. Within it, we have the
expression `self::SIDES`. Because we are using `self` within a class method,
`self` in this context will reference the calling class. When then use the
namespace resolution operator `::` to tell Ruby where to look for the constant
`SIDES`. This will output 4.

On line 26, the `p` method is invoked, passing in the return value of invocation
of the `Shape#sides` instance method on object instantiated from the `Square`
class. The `Shape#sides` method is available to `Square` because it subclasses
from `Quadrilateral`, which subclasses from `Shape`. Within the `Shape#sides`
method definition on line 15, we have the expression `self.class::SIDES`.
Because `self` is being used within an instance method, `self` will reference
the calling object. We then call the `class` method on the calling object, which
returns the class the object is instantiated from. We then use the namespace
resolution operator to tell Ruby to look in that class for the constant `SIDES`.
Line 26, will output 4.

On line 27, the `p` method is invoked, passing in the return value of calling
the `Describable::describe_shape` method on an object instantiated from the
`Square` class. The `Describable::describe_shape` method is defined on lines
2-4, which returns a string. The string uses string interpolation to interpolate
the expression `self.class` which will invoke the class method on `self`, which
references the calling object. This will return the class the object calling the
`describe_shape` method belongs to. It also interpolates the constant `SIDES`.
This will throw an error because constant variables have lexical scope. When
referencing a constant, Ruby will first check lexically - it will search the
surrounding structure of the constant reference, which in this case, will be the
`Describable` module. Because it's not found there, and there are no other
classes or modules in the method lookup path of `Describable` module, an error
will be thrown.

When we use the namespace resolution operator in the `Shape::sides` and
`Shape#sides` methods, it tells Ruby where to begin it's search. If it doesn't
find it in the surrounding structure, it will then try to resolve it by
searching the method lookup path for that class. For the `Square` class, the
method lookup path will be [Square, Quadrilateral, Shape, Describable, Object,
Kernel, BasicObject].
=end