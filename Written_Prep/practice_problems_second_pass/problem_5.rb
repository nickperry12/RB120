class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.


# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches
# tall.”` Why does our `change_info` method not work as expected?

=begin
The `#change_info` method does not work as expected because of the syntax within
the method definition; Ruby thinks we're initializing a local variable instead
of calling the `setter` methods for the instance variables `@name`, `@height`
and `@weight`.

When Ruby sees `name = n`, `height = h` and `weight = w`, it thinks we're
initializing local variables due to the syntax being used. So instead of the
`setter` method being called, we're instead left with local method variables
that are being initialized to the arguments being passed in.

To remedy this, we need to prefix `name`, `height` and `weight` with `self`.
`self` used within an instance method will reference the calling object, and in
turn will invoke the `setter` methods, reassigning the values of `@name`,
`@height` and `@weight` to the arguments being passed in.
=end
