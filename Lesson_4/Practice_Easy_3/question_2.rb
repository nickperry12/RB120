# Question 2

# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# We can redefine the method like so:

# def self.hi
#   greeting = Greeting.new
#   greeting.greet("Hey")
# end

# This creates a class method that's available to the `Hello` class, and within
# the method a object is instantiated from the `Greeting` class, which then has
# the `greet` method called on it.