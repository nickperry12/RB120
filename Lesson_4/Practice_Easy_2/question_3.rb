# Question 3

# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# We can find an objects ancestors and method look up path by calling the
# `ancestors` method on the class in question. If we were to call `ancestors`
# on the `HotSauce` class, it would return the following array:

# [HotSauce, Taste, Object, Kernel, BasicObject]

# If we were to call the `ancestors` method on the `Orange` class, it would
# return the following array:

# [Orange, Taste, Object, Kernel, BasicObject]

# This will also be the class' method look up path. When a method is called on
# an object of that class, it will first look within the class itself, then any
# supeclasses, then any mixed in modules, followed by the built-in Ruby classes.

# If the method isn't found within any of the classes or modules, an error will
# be thrown -- a `NoMethodError`. 




# LS Solution:

# The list of ancestor classes is also called a lookup chain, because Ruby will
# look for a method starting in the first class in the chain (in this case
# HotSauce) and eventually lookup BasicObject if the method is found nowhere in
# the lookup chain.

# If the method appears nowhere in the chain then Ruby will raise a
# NoMethodError which will tell you a matching method can not be found anywhere
# in the chain.
  
# Keep in mind this is a class method and it will not work if you call this
# method on an instance of a class (unless of course that instance has a method
# called ancestors).
