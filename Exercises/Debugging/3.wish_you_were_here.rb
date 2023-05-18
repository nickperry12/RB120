# Wish You Were Here

# On lines 37 and 38 of our code, we can see that grace and ada are located at
# the same coordinates. So why does line 39 output false? Fix the code to
# produce the expected output.

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

=begin
Solution:

The issue is that we invoking the `==` on a `GeoLocation` object and passing in
another `GeoLocation` object as an argument. This will compare the objects
themselves, not just the location coordinates. In order to fix this, we can
define our own `==` method within `GeoLocation` and tell it explicitly what to
compare. In this case, we want to compare the values of the `latitude` and
`longitude` instance variables of each object. Both must have the same value to
return `true` so we can use the `&&` operator to make both comparisons within
the method.
=end