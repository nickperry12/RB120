# Complete The Program - Houses

# Assume you have the following code and output:

# Home 1 is cheaper
# Home 2 is more expensive

# Modify the House class so that the above program will work. You are permitted
# to define only one new method in House.

=begin
Rules:

Can only add one method into `House` class

The code below is showing "home1 < home2"
- We need to somehow have home1 and home2 return the values of the homes
  - Is this possible without using getter methods?
  - How else can we solve this?

LS Solution:

include the `Comparable` module and then define a method `<=>`
- this method will override the `<=>` method within the `Comparable` module
- pass in the other house as an argument
- compare price to the other price using <=>
=end

class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1