# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# Calling `new` on the `Oracle` class will instantiate a new object of that
# class, and will assign it to the variable `oracle`. We are then invoking the
# instance method `predict_the_future` on the `oracle` object. On lines 10-12,
# the `choices` method is defined; this method returns an array of strings.
#
# Within the `predict_the_future` method definition on lines 6-8, the string
# "You will " has the `+` method invoked on it, with the return value of
# `choices` having the `sample` method called on it. This will return a
# randomly selected string from the array that `choices` returns, and will
# concatenate it will "You will ".



# LS Solution

# Each time you call, a string is returned which will be of the form "You will
# <something>", where the something is one of the 3 phrases defined in the array
# returned by the choices method. The specific string will be chosen randomly.