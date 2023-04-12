# Only Pass the Year

# Using the following code, allow Truck to accept a second argument upon
# instantiation. Name the parameter bed_type and implement the modification so
# that Car continues to only accept one argument.

=begin
Our goal here is to allow the `Truck` class to accept a second argument for
it's `initialize` method. Currently, `Truck` is inheriting that method from
the `Vehicle` superclass. While we could add a second parameter to that method,
it ignores the rule of only allowing `Car` to continue only accepting one
argument.

What we can do instead is define an `initialize` method within `Truck`, and
within that method definition, call the `super` method to also invoke the
`initialize` method from further up the class hierarchy. We can then add a
second parameter `bed_type`, allowing `Truck` objects to pass a second argument
to `initialize` while only allowing `Car` objects to pass one.

We can also add in the `attr_reader` method into `Truck`, adding the symbol
`:bed_type` to create a getter method. To prevent `super` from being passed both
arguments, we can manually pass in only one argument to it.
=end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year) # specifically passing in only one argument
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
car1 = Car.new(2001, 'no bed') # throws an ArgumentError