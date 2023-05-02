# Question 5

# Which of these two classes would create objects that would have an instance
# variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Objects instantiated from the `Pizza` class would have an instance variable.
# We know this because within the `initialize` instanec method, the instance
# variale `@name` is being initialized to the argument `name`. Instance
# variables have an `@` appended to the variable name; the `@` is what lets us
# know it's an instance variable.

# We can also instantiate an object from each class, and then call the
# `instance_variables` method on each object. This will return an array of all
# of the available instance variables in the respective class.

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables

# LS Solution

# same as mine