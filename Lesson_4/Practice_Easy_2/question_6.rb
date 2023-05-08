# Question 6

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?

# The `self.manufacturer` method is a class method. Class methods are prefixed
# with the reserved word `self`. To call a class method, we call the method on
# the class itself as opposed to objects instantiated from the class.