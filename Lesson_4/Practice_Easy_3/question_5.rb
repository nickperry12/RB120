# Question 5

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
# this will insantiate a new object of the `Television` class to the variable
# `tv`

tv.manufacturer
# this will attempt to call the class method `manufacturer` on the `tv` object
# this will throw an error because you can't call class methods on objects

tv.model
# the instance method `model` is called the `tv` object (an instance of the
# `Television` class). This will be executed without an error.

Television.manufacturer
# the class method `manufacturer` is being called directly on the `Television`
# class, so this will execute without error

Television.model
# we are attempting to call an instance method on the class, this will throw
# an error because instance methods cannot be called on the class, only
# instances of that class.