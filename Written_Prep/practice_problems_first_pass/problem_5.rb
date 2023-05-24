class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
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
The `change_info` method does not work as expected due to the syntax. The
`change_info` method is defined on lines 10-14. Within the method definition we
have the following code:

```
name = n
height = h
weight = w
```

When Ruby parses those lines, it's behaving as if we're initializing local
method variables instead of calling the setter methods. To make this code work,
we would need to prefix `self` to `name`, `height` and `weight`; this tells Ruby
we're calling setter methods instead of initializing variables.
=end