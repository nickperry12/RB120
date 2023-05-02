# Question 8

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the `cats_count` method we have used self. What does self refer
# to in this context?

# `self` here will be referring to the calling class (`Cat`). When `self` is
# prepended to a method definition name, we know that we are defining a class
# method. Class methods are called on the class itself. 