module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   


# What is output and why? What does this demonstrate about instance variables?

=begin
The expression `teddy.swim` on line 16 will output `nil`. The `Dog#swim` method
will return `"swimming"` if `@can_swim` instance variable references a "truthy"
value. However, at this point, `@can_swim` hasn't been initialized to anything,
so by default Ruby will assign it a value of `nil`. As a result, the method will
return `nil`; there is no `else` clause telling it to return anything else.

To remedy this, we would need to invoke the `Swimmable::enable_swimming` method
on the `teddy` object, initializing `@can_swim` to `true`. This would give us
the desired output of `"swimming!"`.

This demonstrates that unlike uninitialized local variables that throw an error
when we try to reference them, Ruby will instead assign an uninitialized
instance variable a default value of `nil`. Additionally, it demonstrates that
even though the `@can_swim` would be initialized to `true` within a method
defined in the `Swimmable` module, that instance variable is made available to
the `Dog` class through interface inheritance; the `Swimmable` module is mixed
into the `Dog` class via the `include` keyword, making all methods and instance
variables within the module available to the class it is mixed into.

It is also important to note that the `#swim` method isn't returning the `nil`
value referenced by `@can_swim`, it's returning `nil` because there is nothing
else in the method to return. It will be similar to invoking a method with no
functionality; when there is nothing within the method body, the method will
return `nil`.
=end
