# Question 7

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does
# self refer to here?

# `self` here is referring to the calling object. In this case, an object that
# is instantiated from the `Cat` class. We know this because `self` is being
# used within an instance method, which can only be called on instances of the
# class.