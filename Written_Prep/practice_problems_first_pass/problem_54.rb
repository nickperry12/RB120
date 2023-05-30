class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive


# What module/method could we add to the above code snippet to output the
# desired output on the last 2 lines, and why?

=begin
To get our desired output, we can mix in the `Comparable` module and then define
our own `<=>` method. It would look like this:

```
class House
  # rest of code omitted

  include Comparable

  def <=>(other)
    price <=> other.price
  end
end
```

The `<=>` is implicity used in other comparison methods. When we define our own
and override the built-in `<=>` method, we can tell it what to specifically
compare between objects. In this case, we're telling the `<=>` method to compare
the value of `price` between two `House` objects. 

By mixing in the `Comparable` module, and defining our own `<=>` method, we are
now given other comparison methods for "free", i.e we no longer have to define
our own and tell them what to compare; our custom `<=>` method does this for us.
The `<=>` method will compare the caller and reciever, and if the value to the
left is greater, it will return `1`. If the value to the left is lesser, it will
return -1, and will return 0 if it is equal.
=end
