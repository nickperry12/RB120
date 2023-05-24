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
`nil` will be output the screen. This happens the `Swimmable::enable_swimming`
method hasn't been invoked, leaving the `@can_swim` instance varaible
uninitialized. On lines 1-5, the `Swimmable` module is defined, and on lines 2-4
the `enable_swimming` method is defined. Within the method, `@can_swim` is
initialized to the boolean `true`. 

On lines 7-13, the `Dog` class is defined with a single method `swim`, which is
defined on lines 10-12. The `Swimmable` module is also mixed in on `line 8`,
giving the `Dog` class access to the public methods defined in `Swimmable`.
Within the `Dog#swim` method definition, the string `"swimming!"` is returned if
`@can_swim` is truthy. Because `@can_swim` is uninitialized and references
`nil` and there is no `else` clause, the method will return `nil`.

This demonstrates that when instance variables are undefined, we can still
attempt to reference them without an error being thrown. When an instance
variable hasn't been initialized, it has a value of `nil`.
=end