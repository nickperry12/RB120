# Question 4

# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# We could add `attr_reader` and `attr_writer` methods, which will create a both
# setter and getters methods. These methods will have the same functionality as
# the `type=` and `type` methods. Alternatively, we can add a `attr_accessor`
# method which will also give us a setter and getter method. We can also change
# the `describe_type` method to reference the `type` getter method instead of
# referencing the `@type` instance variable directly. It's standard practice to
# reference the instance variable without `@` if a getter method is available.

wax = BeesWax.new("Sweet")
p wax.type
wax.type = "Bitter"
p wax.type
wax.describe_type